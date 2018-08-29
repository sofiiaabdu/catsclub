require 'net/http'
require 'json'

class SearchController < ApplicationController

  def index

    api_key = '9a61a57a-9441-4c04-9bea-6da7ce1440b5'

    url = "https://api.thecatapi.com"
    uri = URI.parse(url + "/v1/images/search")
    response = Net::HTTP.get_response(uri)
    response['Content-Type'] = 'application/json'
    response['x-api-key'] = api_key
    @rnd_img = JSON.parse(response.body)

    respond_to do |format|
      format.html do
        render
      end
      format.json do
        render json: {
            url: "https://78.media.tumblr.com/tumblr_lzhyni85ln1qzv52ko1_500.jpg"
        }
      end
    end
  end
end