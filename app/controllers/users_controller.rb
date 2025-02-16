class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Succesfully updated user!"
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Succesfully updated user!"
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.expect(user: [ :id, :username, :email, :password ])
  end
end
