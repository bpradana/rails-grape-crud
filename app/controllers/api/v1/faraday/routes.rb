class Api::V1::Faraday::Routes < Grape::API
  mount Api::V1::Faraday::Resources::Faraday
end