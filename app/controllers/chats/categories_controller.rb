class Chats::CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize! :chat, @category
  end
end