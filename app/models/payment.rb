class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  has_many :tickets, dependent: :destroy

  enum status: { failure: 0, success: 1, pending: 2 }

  has_attached_file :evidence, styles: { default: "600x700" }

  before_create do |payment|
    payment.code = Payment.code
  end
  # after_create :add_ticket

  class << self
    def code
      loop do
        code = App.generate_code
        break code unless exists?(code: code)
      end
    end

    def invoice(user, event)
      "#{Time.zone.now.strftime("%Y%m%d-%H%M")}-#{event.id}-#{user.id}"
    end

    def omise_charge(user, event, sections, amount, omise_token)
      begin
        # card = Omise::Token.create(card: {
        #   name: "Somchai Prasert",
        #   number: "4242424242424242",
        #   expiration_month: 10,
        #   expiration_year: 2018,
        #   city: "Bangkok",
        #   postal_code: "10320",
        #   security_code: 123
        # })
        # omise_token = card.id

        charge = Omise::Charge.create({
          amount: amount.to_i * 100,
          currency: "thb",
          description: "test", #invoice(event, user),
          card: omise_token
        })

        if charge.status == 'successful'
          pay = create(status: :success, provider: 'omise', user: user, event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)
          binding.pry
          sections.each do |section|
            (1..section.qty).each do |i|
              p i
              Ticket.create_ticket(user, event, section.id, pay)
            end
          end

          pay
        else
          pay = create(status: :failure, provider: 'omise', user: user, event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)
        end
      rescue Exception => e
        e
      end
    end

    def transfer_notify(user, event, sections, amount)
      begin
        pay = create(status: :pending, provider: 'transfer', user: user, event: event, amount: amount)
        sections.each do |section|
          Ticket.create_ticket(user, event, section, pay)
        end

        pay
      rescue Exception => e
        e
      end
    end


    def transfer_checkout(user, event, evidence=nil)
      update(status: :success, user: user, event: event, evidence: evidence)
    end

    def transfer_approve(user, event, payment)
      Ticket.create_ticket(user, event, payment)
    end
  end

  private
    # def add_ticket
    #   Ticket.create_ticket(self.user, self.event, self) if provider = 'omise'
    # end
end
