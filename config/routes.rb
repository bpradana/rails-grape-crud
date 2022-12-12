# frozen_string_literal: true

Rails.application.routes.draw do
  mount Api::Init => '/api'
end
