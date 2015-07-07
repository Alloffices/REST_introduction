class UsersController < ApplicationController

  #REST actions standards

  #displays all users
  def index
    @user = User.all
  end

  #display form for new user
  def new
    @user = User.new
  end

  #saves new record and renders => will do some logic
  def create
    #passes in allowed_params 
    @user = User.new(allowed_params)

    if @user.save
      #after saving the user attributes this will redirec to index
      redirect_to users_path
    else
      #if the user attributes did not save reload new form
      render 'new'
    end
  end

  #used to display a record of a individual instance
  def show
    @user = User.find(params[:id])
    
  end

  #displays form for existing
  def edit
    @user = User.find(params[:id])
  end

  #saves new record => will do some logic
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(allowed_params)
      redirect_to users_path
    else
      render 'new'
    end
  end

  #destroys and renders index => will do some logic
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  #this is so that if a user want to send unwanted attributes they cant
  def allowed_params
    params.require(:user).permit(:name, :email)
  end

end
