# frozen_string_literal: true

module SuccessFormatter
  def self.call(object, env)
    response = {
      message: env['api.response.message'].present? ? env['api.response.message'] : 'Success retrieve data',
      data: object
    }
    response.to_json
  end
end
