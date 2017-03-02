module Admin
  class UsersController < ApplicationController
    load_and_authorize_resource

    def index
      @users = User.paginate(:page => params[:page], :per_page => 10)
    end

    def change_role
      @user = User.find(params[:id])

      if @user.has_role? :user
        assign_new_role(:user, :moderator)
      else
        assign_new_role(:moderator, :user)
      end

      redirect_to admin_users_path, :notice => 'Role changed!'
    end

    private

    def assign_new_role(old_role, new_role)
      @user.remove_role old_role
      @user.add_role new_role
    end

  end
end
