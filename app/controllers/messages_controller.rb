class MessagesController < ApplicationController

  before_action :authenticate_user!, :move_to_index, except: [:index]

  def index
    @messages = Message.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @message = Message.new
  end



  def create
    @message = Message.new(message: message_params[:message], image:message_params[:image], user_id: current_user.id)
    @message.save

    redirect_to action: :index
  end

  def destroy
    message = Message.find(params[:id])
      if message.user_id ==current_user.id
        message.destroy
      end

    redirect_to action: :index
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
      if @message.user_id == current_user.id
        @message.update(message_params)
      end
    redirect_to action: :index
  end

  private
  def message_params
    params.require(:message).permit(:message, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end
