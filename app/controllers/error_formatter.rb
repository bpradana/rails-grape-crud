module ErrorFormatter
  def self.call(message, backtrace, options, env, original_exception)
    response = {
      message: message,
      backtrace: backtrace
    }
    response.to_json
  end
end
