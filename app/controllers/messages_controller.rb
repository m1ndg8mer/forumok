class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.category = Category.find(params[:category_id])
    @message.user = User.first

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
