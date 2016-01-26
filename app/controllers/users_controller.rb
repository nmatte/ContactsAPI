# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def favorites
    render json: User.find(params[:id]).get_favorites
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  private

  def user_params
    # { user: {name: "Jeff", age: 29}}
    params.require(:user).permit(:username)
  end
end
