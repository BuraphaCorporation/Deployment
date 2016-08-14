class InvitationMailer < MandrillMailer::TemplateMailer
  default from: 'support@example.com'

  def invite(invitation)
    # in this example `invitation.invitees` is an Array
    invitees = invitation.invitees.map { |invitee| { email: invitee.email, name: invitee.name } }

    mandrill_mail(
      template: 'group-invite',
      subject: I18n.t('invitation_mailer.invite.subject'),
      to: invitees,
        # to: invitation.email,
        # to: { email: invitation.email, name: 'Honored Guest' },
      vars: {
        'OWNER_NAME' => invitation.owner_name,
        'PROJECT_NAME' => invitation.project_name
      },
      important: true,
      inline_css: true,
      recipient_vars: invitation.invitees.map do |invitee|
        { invitee.email =>
          {
            'INVITEE_NAME' => invitee.name,
            'INVITATION_URL' => new_invitation_url(
              invitee.email,
              secret: invitee.secret_code
            )
          }
        }
      end
     )
  end
end
