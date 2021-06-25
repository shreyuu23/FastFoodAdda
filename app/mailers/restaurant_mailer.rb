class RestaurantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  def owner_greeting(email, password)
  		@email = email
  		@password = password
		mail to: email,
		 subject: "Your Restaurant Created"
		end
	end
