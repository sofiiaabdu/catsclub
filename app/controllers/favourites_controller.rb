require 'net/http'
require 'json'
require 'uri'

class FavouritesController < ApplicationController
  before_action :set_url

  def index
    @response = get_request(@url)
  end

  def create
    post_request(@url)
    redirect_to "/favourites"
  end

  private

  def set_url
    @url = 'https://api.thecatapi.com/v1/favourites/'
  end
end