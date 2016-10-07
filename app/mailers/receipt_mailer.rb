class ReceiptMailer < ApplicationMailer
  default from: 'chaunceyandcoco.orders@gmail.com'
  helper_method :current_or_guest_user

  def order_confirmation(user, order)
    @user= user
    @order = order
    mail(to: [order.email,'chaunceyandcoco.orders@gmail.com'], subject: 'Order has been received')
  end
end
