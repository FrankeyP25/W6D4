class UsersController < ApplicationRecord

    def index 
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)
        render json: @user.errors.full_messages, status: 422 if !@user.save    
    end

    # def show

    # end

    private
    def user_params
        params.require(:users).permit(:username)        
    end
end