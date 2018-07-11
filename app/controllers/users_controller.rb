class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :followers, :followings, :follow]

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
        @user.update(user_params)
        @user.follow(User.find(params[:follow]))
        head :no_content
    end

    # DELETE /users/:id
    def destroy
        @user.destroy
        head :no_content
    end

    # GET /users/:id/followers
    # http :3000/users/7/followers
    def followers
        json_response(@user.followers)
    end

    # GET /users/:id/following
    # http :3000/users/2/following
    def followings
        json_response(@user.follows)
    end

    private

        def user_params
            # whitelist params
            #should password be allowed?
            params.permit(:name, :email, :password_digest)
        end

        def set_user
            @user = User.find(params[:id])
        end

end
