class MessagesController < ApplicationController
      before_action :set_flr
	  before_action :set_message, only: [:show, :destroy]

  def index
   @messages = @flr.messages.order(:link)
  end

  def show
  
  end

  def retrieve_posts

  end

  def new
  	 @message = @flr.messages.new()
  end

  def create
  	@page_ar = Set[]
  	(1..@flr.info.to_i).each do |page|
  	  @one_page_ar = ForumWS.new(page).review_arr
  	  @page_ar.add(@one_page_ar) 
  	end

  	@page_ar.flatten!

  	@page_ar.each do |record|
  		@message = @flr.messages.new(body: record.body, link: record.link, author: record.author )
  		@message.save
  	end

    redirect_to flr_messages_path, notice: 'Story was successfully created.'

  end

  def destroy
  	@message.destroy
    redirect_to flr_messages_url, notice: 'Msg was successfully destroyed.' 
  end
  

  private

  def set_flr
  	@flr = @current_flr
  end

     def set_message
      @message = @flr.messages.find(params[:id])
    end 

     def message_params
      params.require(:message).permit(:body, :link, :author, :flr_id)
    end

end
