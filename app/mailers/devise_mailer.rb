class DeviseMailer < Devise::Mailer
  default from: 'WadeAlike <hello@wadealike.com>'
  # default template_path: 'users/mailer'

  layout 'mailer'

  def reset_password_instructions(record, token, opts={})
    super
  end
end
