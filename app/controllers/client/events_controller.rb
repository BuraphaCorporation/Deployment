class Client::EventsController < Client::CoreController

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
    @related_events = Event.all.first(3)

    @tickets = [
      { title: 'VIP',     price: 1000, quantity: 1 },
      { title: 'General', price: 500, quantity: 1 },
    ]
  end

  def payment
    @event = Event.friendly.find(params[:event_id])

    @tickets = [
      { title: 'VIP',     price: 1000, quantity: 1 },
      { title: 'General', price: 500, quantity: 1 },
    ]

    @total = 1500
  end

  def checkout
    @event = Event.friendly.find(params[:event_id])
    @related_events = Event.all.first(3)

    if params[:payment_method] == 'credit_card'

      # charge = Omise::Charge.create({
      #   amount: 10000,
      #   currency: "thb",
      #   # description: inv,
      #   card: params[:omise_token]
      # })

      # binding.pry

      render "client/events/payment-credit-card"

    elsif params[:payment_method] == 'bank_transfer'
      render "client/events/payment-bank-transfer"
    else

    end
  end

end
