class ImagesController < ApplicationController

  def show
    url = "https://api.thecatapi.com/v1/images/#{params['id']}"
    @response = get_request(url)

    respond_to do |format|
      format.json do
        render json: {
            url: @response['url']
        }
      end
    end
  end
end