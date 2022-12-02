class Api::V1::Main < Grape::API
  version 'v1', using: :path
  format :json

  mount Api::V1::User::Routes
  mount Api::V1::Post::Routes
end