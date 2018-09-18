require 'net/http'
require 'json'

class SearchController < ApplicationController

  def index
    url = "https://api.thecatapi.com/v1/images/search"
    @random_image = get_response(url)
  end
end