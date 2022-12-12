# frozen_string_literal: true

module ErrorFormatter
  def self.call(message, backtrace, _options, _env, _original_exception)
    response = {
      message:,
      backtrace:
    }
    response.to_json
  end
end
