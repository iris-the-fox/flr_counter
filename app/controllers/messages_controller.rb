class MessagesController < ApplicationController
    before_action :set_page, only: [:index, :new, :create]
	  before_action :set_message, only: [:show, :destroy]

  def index
   @messages = @page.messages.order(:link)
  end

  def show
  
  end

  def retrieve_posts

  end

  def new
  	 @message = @page.messages.new()
  end

  def create
    set = MessageArrayWS.new(@page.body).review_arr
    set.each do |review|
      @message = @page.messages.create(body: review.body, link: review.link, author: review.author)
    end

    redirect_to flr_page_messages_path, notice: 'Messages was successfully created.'

  end

  def destroy
  	@message.destroy
    redirect_to flr_page_messages_url, notice: 'Msg was successfully destroyed.' 
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
