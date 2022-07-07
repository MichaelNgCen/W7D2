class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end
    
    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if user
            login(user)
        else
            flash[:errors] = ["Invalid credentials"]
            render :new
        end
    end
    

    def show
        @user = User.find(params[:id])
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end
