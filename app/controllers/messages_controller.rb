class MessagesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

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

end
