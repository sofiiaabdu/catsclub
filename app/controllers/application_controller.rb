class ApplicationController < ActionController::Base

  def get_request(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    JSON.parse(request_to_api(request, uri))
  end

  def post_request(url)
    uri = URI.parse(url)
    request = Net::HTTP::Post.new(uri)
    request_to_api(request, uri)
  end

  def get_response(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response = set_credentials(response)
    JSON.parse(response.body)
  end

  def request_to_api(request, uri)
    http = new_http_object(uri)
    request = set_credentials(request)
    request.body = user.to_json

    response = http.request(request)
    response.read_body
  end

  def new_http_object(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http
  end

  private

  def set_credentials(request)
    request["Content-Type"] = 'application/json'
    request["x-api-key"] = ENV['API_KEY']
    request
  end

  def user
    {
        'image_id': params['image_id'],
          'sub_id': 'aqsoa7'
    }
  end

end
