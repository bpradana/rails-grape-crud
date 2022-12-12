# frozen_string_literal: true

class Api::V1::Post::Routes < Grape::API
  mount Api::V1::Post::Resources::Post
end
