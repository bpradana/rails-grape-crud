# frozen_string_literal: true

class CustomAlpha < Grape::Validations::Validators::Base
  def validate_param!(attr_name, params)
    return if params[attr_name] =~ /^[a-zA-Z ]+$/

    raise Grape::Exceptions::Validation.new params: [@scope.full_name(attr_name)], message: 'must be alpha'
  end
end
