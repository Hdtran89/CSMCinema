class MessageMailer < ApplicationMailer

	default from: "#{message.name} #{message.email}"
  default to: "Hieu Tran <hdtran89@gmail.com>"

  def new_message(message)
    @message = message   
    mail subject: "Message from #{message.name}"
  end

end
