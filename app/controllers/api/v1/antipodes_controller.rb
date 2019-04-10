class Api::V1::AntipodesController < ApplicationController
  def show
    if valid_key?
      render json: AntipodeSerializer.new(Antipode.new(params[:lat], params[:long]))
    else
      render body: "Unauthorized", status: 401
    end
  end

  private

  def lat_long
    params.permit(:lat, :long)
  end

  def valid_key?
    puts "incoming"
    puts request.env["API_KEY"]
    puts ENV['api_key']
    request.env["API_KEY"] == ENV['api_key']
  end

end
