class Api::Init < Grape::API
  formatter :json, SuccessFormatter
  error_formatter :json, ErrorFormatter

  mount Api::V1::Main
end
