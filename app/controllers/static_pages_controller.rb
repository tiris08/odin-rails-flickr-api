class StaticPagesController < ApplicationController
  require 'flickr'

  def show
    begin
      flickr = Flickr.new ENV['pusher_key'], ENV['pusher_secret']
      if !params[:id].blank? 
        @photos = flickr.photos.search(user_id: params[:id])
      end
    rescue StandardError 
      flash[:alert] = "Please try again..."
      redirect_to root_path
    end
  end
end
