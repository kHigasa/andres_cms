class ContactsController < ApplicationController
  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)
    if @contact.errors.empty? && @contact.save
      ContactMailer.send_email(@contact).deliver_now
      redirect_to about_path, notice: I18n.t('activerecord.flash.contact.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.contact.actions.create.failure')
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
