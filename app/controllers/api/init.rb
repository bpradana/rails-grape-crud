class Api::Init < Grape::API
  mount Api::V1::Main
end
