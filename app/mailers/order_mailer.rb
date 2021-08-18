class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirm_mail.subject
  #
  def confirm_mail(order)
    @order = order

    mail to: User.find(@order.user_id).email, subject: '注文を承りました。'
  end
end
