class Api::V1::Main < Grape::API
  version 'v1', using: :path
  default_format :json

  mount Api::V1::User::Routes
  mount Api::V1::Post::Routes
  mount Api::V1::Faraday::Routes
  mount Api::V1::Sidekiq::Routes
end
