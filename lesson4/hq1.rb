class SecretFile
  def initialize(secret_data)
    @data = secret_data
    @log = SecurityLogger.new
  end

  def data
    @log.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end