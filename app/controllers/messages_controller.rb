class MessagesController < ApplicationController
      before_action :set_flr
	  before_action :set_message, only: [:show, :destroy]

  def index
   @messages = @flr.messages
  end

  def show
  
  end

  def retrieve_posts

  end

  def new
  	 @message = @flr.messages.new()
  end

  def create
  	
  	@message = @flr.messages.new(link: 'some link' )
  	if @message.save
         redirect_to flr_messages_path, notice: 'Story was successfully created.'
        else
         render :new 
    end
  end

  def destroy
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
