class Api::V1::User::Routes < Grape::API
  mount Api::V1::User::Resources::User
end
