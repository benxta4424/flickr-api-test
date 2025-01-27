class UsersController < ApplicationController
  require "flickr"
  before_action :set_flickr
  def index
    unless params[:user_id].nil?
      @photos=flickr.photos.search(user_id: params[:user_id])
    end
  end

  def set_flickr
    @flickr=Flickr.new(Figaro.env.flickr_api_key, Figaro.env.flickr_api_secret_key)
  end
end
