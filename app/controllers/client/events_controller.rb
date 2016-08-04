class Client::EventsController < Client::CoreController
  # before_action :event, only: [:show, :express]
  before_action :related_events, only: [:show, :checkout]

  def index
    @category  = Category.all
    @galleries = Gallery.all.shuffle.first(5)

    @events = if params[:category].present? and @category.pluck(:name).include?(params[:category])
      Category.friendly.find(params[:category]).events
    else
      Event.all
    end

    @covers = [
      { image: '/src/images/content/cover-1.jpg', caption: '<h1 class="title">เพราะเราเชื่อว่า ชีวิตไม่ได้มีด้านเดียว</h1><div class="subtitle">ค้นพบกิจกรรมและอีเว้นท์เจ๋งๆ พร้อมสัมผัสประสบการณ์ใหม่ๆ ได้ที่นี่</div>' },
      { image: '/src/images/content/cover-2.jpg', caption: '<h1 class="title">เพราะเราเชื่อว่า ชีวิตไม่ได้มีด้านเดียว</h1><div class="subtitle">ค้นพบกิจกรรมและอีเว้นท์เจ๋งๆ พร้อมสัมผัสประสบการณ์ใหม่ๆ ได้ที่นี่</div>' },
    ]
  end

  def show
    @event = Event.friendly.find(params[:id])
    @section = @event.sections.min_by(&:price)

    @tickets = [
      { title: 'VIP',     price: 1000, quantity: 1 },
      { title: 'General', price: 500, quantity: 1 },
    ]
  end

  def express
    @event = Event.friendly.find(params[:event_id])
    @section = @event.sections.min_by(&:price)

    @total = 0
    @tickets = {}
    @event.sections.each do |section|
      if params[:section]["#{section.id}"].to_i > 0
        @tickets.merge!({ "#{section.id}":
          {
            title: section.title,
            price: section.price,
            quantity: params[:section]["#{section.id}"].to_i
          }
        })
        @total += section.price
      end
    end
  end

  def checkout
    @event = Event.friendly.find(params[:event_id])
    if params[:payment_method] == 'credit_card'
      Payment.omise_charge(@event, current_user, params[:payment_amount], params[:omise_token])
      render "client/events/payment-credit-card"
    elsif params[:payment_method] == 'bank_transfer'
      Payment.transfer_notify(@event, current_user, params[:payment_amount])
      render "client/events/payment-bank-transfer"
    end
  end

private
  def related_events
    @related_events = Event.all.first(3)
  end
end
