class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists.
    if user
      # If the password entered is correct.
      if user.authenticate(params[:email],params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
      else
        # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
      end
    else
      # If user doesn't exist, send them back to the sign up form.
        redirect_to '/signup'
    end
  end

  def destroy()
    puts "destroying session"
    session[:user_id] = nil
    session.delete(current_user)
    redirect_to '/login'
  end

end