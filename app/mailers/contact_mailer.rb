class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: user.email, subject: "WedPhoto ユーザ登録完了"
  end
end
