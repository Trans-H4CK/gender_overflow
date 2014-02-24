class Chats::GlobalController < ApplicationController
  def show
    authorize! :show, :global_chat
  end
end