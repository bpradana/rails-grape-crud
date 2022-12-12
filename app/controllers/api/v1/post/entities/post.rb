# frozen_string_literal: true

class Api::V1::Post::Entities::Post < Grape::Entity
  expose :id
  expose :title
  expose :body
  expose :user_id
end
