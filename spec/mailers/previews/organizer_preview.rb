# Preview all emails at http://localhost:3000/rails/mailers/organizer
class OrganizerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/organizer/order
  def order
    OrganizerMailer.order
  end
end
