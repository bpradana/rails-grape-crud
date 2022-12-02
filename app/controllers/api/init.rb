class Api::Init < Grape::API
  formatter :json, SuccessFormatter
  error_formatter :json, ErrorFormatter
  rescue_from :all, backtrace: true

  mount Api::V1::Main
end
