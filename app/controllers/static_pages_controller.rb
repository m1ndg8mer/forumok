class StaticPagesController < ApplicationController
  def home
    @clients_count = User.all.count
    @categories_count = Category.published.count
    @messages_count = Message.count
    @roles_count = Role.all.count
    @last_categories = Category.published.limit(3)
  end
end
