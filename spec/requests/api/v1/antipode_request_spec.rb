require 'rails_helper'

describe 'Items API' do
  it 'sends an antipode lat and long' do
    lat = "27.97"
    long = "-82.43"

    get '/api/v1/antipodes', params: {lat: lat, long: long}, headers: {'API_KEY' => ENV['api_key']}


    expect(response).to be_successful
    coords = JSON.parse(response.body, symbolize_names: true)

    expect(coords[:data][:attributes][:lat]).to eq(-27.97)
    expect(coords[:data][:attributes][:long]).to eq(97.57)

    lat = "27.97"
    long = "82.43"
    get '/api/v1/antipodes', params: {lat: lat, long: long}, headers: {'API_KEY' => ENV['api_key']}

    expect(response).to be_successful

    coords = JSON.parse(response.body, symbolize_names: true)

    expect(coords[:data][:attributes][:lat]).to eq(-27.97)
    expect(coords[:data][:attributes][:long]).to eq(-97.57)
  end

  it 'does not authenticate properly' do
    lat = "27.97"
    long = "-82.43"

    get '/api/v1/antipodes', params: {lat: lat, long: long}, headers: {'API_KEY' => "WRONG KEY"}


    expect(response).to_not be_successful
    expect(response.body).to eq("Unauthorized")
  end

end
