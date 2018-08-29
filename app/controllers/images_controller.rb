class ImagesController < ApplicationController

  def show


    url_search = "https://api.thecatapi.com/v1/images/#{params['id']}"
    @resp = request_to_api(url_search)


    respond_to do |format|
      format.json do
        render json: {
            url: @resp['url']
        }
      end
    end
  end

  def request_to_api(url)
    api_key = '9a61a57a-9441-4c04-9bea-6da7ce1440b5'

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    header = {'Content-Type': 'application/json', 'x-api-key': api_key}
    req = Net::HTTP::Get.new(uri, header)
    response = http.request(req)
    JSON.parse(response.read_body)
  end
end