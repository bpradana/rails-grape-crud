module SuccessFormatter
  def self.call(object, _env)
    { status: _env['api.response.code'], data: object }.to_json
  end
end
