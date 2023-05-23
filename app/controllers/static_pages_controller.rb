class StaticPagesController < ApplicationController
  def show
    flickr = Flickr.new ENV['pusher_key'], ENV['pusher_secret']
    @photos = flickr.photos.search(user_id: params[:id]) if params[:id].present? 
  rescue StandardError 
    flash[:alert] = "Please try again..."
    redirect_to root_path
  end
end
