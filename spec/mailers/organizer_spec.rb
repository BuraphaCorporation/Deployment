require "rails_helper"

RSpec.describe OrganizerMailer, type: :mailer do
  describe "order" do
    let(:mail) { OrganizerMailer.order }

    # it "renders the headers" do
    #   expect(mail.subject).to eq("Order")
    #   expect(mail.to).to eq(["to@example.org"])
    #   expect(mail.from).to eq(["from@example.com"])
    # end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Hi")
    # end
  end
end
