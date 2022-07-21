# frozen_string_literal: true
class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = User.find_by_id(params[:id])

    if user
      render json: user, status: :ok
    else
      payload = { error: 'User not found', status: :bad_request }
      render json: payload, status: :bad_request
    end
  end

  def create
    user = User.new(
      name: user_params[:name],
      email: user_params[:email]
    )

    if user.save
      render json: user, status: :ok
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  def update
    user = User.find_by_id(params[:id])

    if user&.update(user_params)
      render json: user, status: :ok
    elsif user.blank?
      payload = { error: 'User not found', status: :bad_request }
      render json: payload, status: :bad_request
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by_id(params[:id])

    if user&.destroy
      render json: user, status: :ok
    elsif user.blank?
      payload = { error: 'User not found', status: :bad_request }
      render json: payload, status: :bad_request
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(%i[name email])
  end
end
