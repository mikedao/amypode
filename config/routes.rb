Rails.application.routes.draw do
  get "/api/v1/antipodes", to: "api/v1/antipodes#show"
end
