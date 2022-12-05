module ErrorFormatter
  def self.call(message, backtrace, options, env, original_exception)
    response = {
      message:,
      backtrace:
    }
    response.to_json
  end
end
