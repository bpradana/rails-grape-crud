# frozen_string_literal: true

class CustomLength < Grape::Validations::Validators::Base
  def validate_param!(attr_name, params)
    return if params[attr_name].length <= @option

    raise Grape::Exceptions::Validation.new params: [@scope.full_name(attr_name)],
                                            message: "must be less than #{@option} characters"
  end
end
