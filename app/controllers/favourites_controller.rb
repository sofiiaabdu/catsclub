require 'net/http'
require 'json'
require 'uri'

class FavouritesController < ApplicationController

  def index
    api_key = '9a61a57a-9441-4c04-9bea-6da7ce1440b5'

    url = URI("https://api.thecatapi.com/v1/favourites")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = 'application/json'
    request["x-api-key"] = api_key

    response = http.request(request)
    @response_arr = JSON.parse(response.read_body)
  end

  def create

    api_key = '9a61a57a-9441-4c04-9bea-6da7ce1440b5'

    url = URI.parse("https://api.thecatapi.com/v1/favourites")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["x-api-key"] = api_key

    user = {'image_id': params['image_id'],
            'sub_id': 'aqsoa7'
    }

    request.body = user.to_json
    response = http.request(request)
    response.read_body

    redirect_to "/favourites"
  end

  def delete

    api_key = '9a61a57a-9441-4c04-9bea-6da7ce1440b5'
    url = URI.parse("https://api.thecatapi.com/v1/favourites")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Delete.new(url)
    request["Content-Type"] = 'application/json'
    request["x-api-key"] = api_key

    response = http.request(request)
    puts response.read_body
  end

end