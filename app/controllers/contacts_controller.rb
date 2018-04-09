class ContactsController < ApplicationController
  def index 
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(permitted_params)
    if @contact.save
      redirect_to contacts_path, notice: "Thank you for your feedback."
    else
      flash[:error] = 'Please provide your message.'
      redirect_to contacts_path
    end
  end

  private

  def permitted_params
    params.require(:contact).permit(
      :name,
      :email,
      :phone,
      :subject, 
      :message
    )
  end
end
