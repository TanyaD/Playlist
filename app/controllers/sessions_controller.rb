class SessionsController < ApplicationController
  def new
  end

  def create
    @user=User.find_by_email(params[:email])
    # if authenticate true
    if @user && @user.authenticate(params[:password])
        # save user id to session
        redirect_to "/users/#{@user.id}"
        session[:user_id]=@user.id
        # redirect to users profile page

    # if authenticate false
        # add an error message -> flash[:errors] = ["Invalid"]
        # redirect to login page
    else
      flash[:errors]=["Invalid combination"]
      redirect_to "/users/new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/users/new'
  end
end
