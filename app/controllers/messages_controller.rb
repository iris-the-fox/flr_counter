# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_page, only: %i[index new get_all_messages]
  before_action :set_message, only: %i[show destroy]

  def index
    @messages = @page.messages.order(:link)
  end

  def show; end

  def new
    @message = @page.messages.new
  end

  def get_all_messages
    @page.all_messages
    redirect_to page_path(@page), notice: 'Messages was successfully created.'
  end  

  def destroy
    @page = @message.page
    @message.destroy
    redirect_to page_messages_url(@page), notice: 'Msg was successfully destroyed.'
  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:raw_boty, :body, :link, :author, :page_id)
  end
end
