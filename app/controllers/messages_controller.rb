class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_owner, only: [:destroy]

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

  def check_owner
    return true if current_user == Message.find(params[:id]).user
    redirect_to Category.find(params[:category_id]), notice: 'Access Denied'
  end

end
