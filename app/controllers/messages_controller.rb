# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_page, only: %i[index new all_messages]
  before_action :set_message, only: %i[show destroy]

  def index
    @messages = @page.messages.order(:link)
  end

  def show; end

  def new
    @message = @page.messages.new
  end

  def all_messages
    set = MessageArrayWS.new(@page.body).review_arr
    set.each do |review|
      @message = @page.messages.new(body: review.body,
                                    link: review.link,
                                    author: review.author)
      @message.save
    end
    redirect_to page_path(@page), notice: 'Messages was successfully created.'
  end

  def destroy
    @message.destroy
    redirect_to page_messages_url, notice: 'Msg was successfully destroyed.'
  end

  private

  def set_page
    @page = Page.find(params[:page_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body, :link, :author, :page_id)
  end
end
