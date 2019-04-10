class Api::V1::AntipodesController < ApplicationController
  def show


    reference_lat = lat_long[:lat].to_f
    reference_long = lat_long[:long].to_f
    lat = reference_lat * -1
    long = 180 - reference_long.abs
    if long > 0 && reference_long > 0
      long  = long * -1
    elsif long < 0 && reference_long < 0
      long = long * -1
    end
    render json: AntipodeSerializer.new(Antipode.new(params[:lat], params[:long]))
  end

private

def lat_long
  params.permit(:lat, :long)
end

end
