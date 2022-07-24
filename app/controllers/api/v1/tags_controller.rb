# frozen_string_literal: true

class Api::V1::TagsController < ApplicationController
  before_action :find_tag, only: %i[show destroy]
  before_action :find_user, only: %i[create update destroy]

  def index
    tags = Tag.all
    render json: tags.to_json(methods: :messages_count), status: :ok
  end

  def show
    if @tag
      render json: @tag,
             include: :messages,
             status: :ok
    else
      payload = { error: 'Tag not found', status: :bad_request }
      render json: payload, status: :bad_request
    end
  end

  def create
    return user_not_found if @user.blank?

    message = find_message
    return message_not_found if message.blank?

    tag = Tag.new(
      name: tag_params[:name]
    )

    if tag.save
      message.tags << tag
      render json: tag, status: :ok
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  def destroy
    return user_not_found if @user.blank?

    message = find_message
    return message_not_found if message.blank?

    if message.tags.delete(@tag)
      render json: @tag, status: :ok
    else
      payload = { error: 'Something went wrong', status: :unprocessable_entity }
      render json: payload, status: :unprocessable_entity
    end
  end

  private

  def find_tag
    @tag = Tag.find_by_id(params[:id])
  end

  def find_user
    @user = User.find_by_id(params[:user_id])
  end

  def find_message
    @user.messages.find_by_id(params[:message_id])
  end

  def tag_params
    params.require(:tag).permit(%i[user_id message_id name])
  end

  def user_not_found
    payload = { error: 'User not found', status: :bad_request }
    render json: payload, status: :bad_request
  end

  def message_not_found
    payload = { error: 'Message not found', status: :bad_request }
    render json: payload, status: :bad_request
  end
end
