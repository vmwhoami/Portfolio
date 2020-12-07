# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :permitted_details, only: %i[create]
  def home
    @posts = Blog.all
  end

  def about; end

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(permitted_details)
    if @contact.save
      flash[:succes] = 'Contact saved'
      redirect_to root_path
    else
      flash[:error] = @contact.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def permitted_details
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
