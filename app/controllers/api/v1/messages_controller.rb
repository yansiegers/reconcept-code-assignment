# frozen_string_literal: true

class Api::V1::MessagesController < ApplicationController
  before_action :find_user, except: :index

  def index
    messages = Message.all
    render json: messages, status: :ok
  end

  def show
    return user_not_found if @user.blank?

    if (message = find_message)
      render json: message, status: :ok
    else
      payload = { error: 'Message not found', status: :bad_request }
      render json: payload, status: :bad_request
    end
  end

  def create
    return user_not_found if @user.blank?

    message = @user.messages.new(
      content: message_params[:content]
    )

    if message.save
      render json: message, status: :ok
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  def update
    return user_not_found if @user.blank?

    message = find_message

    if message&.update(message_params)
      render json: message, status: :ok
    elsif message.blank?
      payload = { error: 'Message not found', status: :bad_request }
      render json: payload, status: :bad_request
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  def destroy
    return user_not_found if @user.blank?

    message = find_message

    if message&.destroy
      render json: message, status: :ok
    elsif message.blank?
      payload = { error: 'Message not found', status: :bad_request }
      render json: payload, status: :bad_request
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find_by_id(params[:user_id])
  end

  def find_message
    @user.messages.find_by_id(params[:id])
  end

  def message_params
    params.require(:message).permit(%i[user_id content])
  end

  def user_not_found
    payload = { error: 'User not found', status: :bad_request }
    render json: payload, status: :bad_request
  end
end
