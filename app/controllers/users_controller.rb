class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :followers, :followings]

    # GET /users
    def index
        @users = User.all
        json_response(@users)
    end

    # POST /users
    def create
        @user = User.create!(user_params)
        json_response(@user)
    end

    # GET /users/:id
    def show
        json_response(@user)
    end

    # PUT /users/:id
    def update
        # user -> 1 brand -> !=1 
        if (params[:is_user] == 1)
            @user.follow(User.find(params[:follow]))
        else
            @user.follow(Brand.find(params[:follow]))
        end
        @user.update(user_params)
        
        head :no_content
    end

    # DELETE /users/:id
    def destroy
        @user.destroy
        head :no_content
    end

    # GET /users/:id/followers
    def followers
        json_response(@user.followers)
    end

    # GET /users/:id/following
    def followings
        json_response(@user.follows)
    end

    private

        def user_params
            params.permit(:name, :email, :password_digest)
        end

        def set_user
            @user = User.find(params[:id])
        end

end