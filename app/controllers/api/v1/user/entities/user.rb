class Api::V1::User::Entities::User < Grape::Entity
  expose :id
  expose :name
  expose :picture
end
