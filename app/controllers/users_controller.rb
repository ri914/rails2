class UsersController < ApplicationController
      def index
        @users = User.all
      end
  
      def new
        @user = User.new
      end
  
      def create
        @user = User.new(params.require(:user).permit(:name))
        if @user.save
          redirect_to :users
        else
          render:new
        end
      end
  
      def show
        @user = User.find(params[:id])
      end
  
      def profile
        @user = User.find(params[:id])
      end
  
      def edit
        @user = User.find(params[:id])
      end
  
      def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:name, :introduce))
          redirect_to user_profile_path
        else
          render:edit
        end
      end
      
      def destroy
        @user = User.find(params[:id])
        @user.destroy
      end
end
