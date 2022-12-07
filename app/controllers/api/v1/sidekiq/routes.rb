class Api::V1::Sidekiq::Routes < Grape::API
  mount Api::V1::Sidekiq::Resources::Sidekiq
end
