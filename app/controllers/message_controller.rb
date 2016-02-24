class MessageController < ApplicationController
	  def new
    @contacts = Contact.new
  end

  def create
    @contacts = Contact.new(params[:contact])
    @contacts.request = request
    if @contacts.deliver
      flash.now[:error] = nil
      flash.now[:notice] = 'Thank you for your message!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
