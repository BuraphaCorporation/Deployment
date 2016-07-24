class Client::EventsController < Client::CoreController

  def index
    @events = Event.includes(:galleries)
  end

  def show
    @event = Event.find(params[:id])
  end

  def payment
    @event = Event.find(params[:event_id])
  end

  def checkout
    charge = Omise::Charge.create({
      amount: 10000,
      currency: "thb",
      # description: inv,
      card: params[:omise_token]
    })

    binding.pry
  end
end
