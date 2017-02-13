class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action -> { owner }, only: [:destroy]

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.category = Category.find(params[:category_id])

    if @message.save
      redirect_to @message.category
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to @message.category
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def owner
    message = Message.find(params[:id])
    unless current_user == message.user
      redirect_to Category.find(params[:category_id])
    end
  end

end
