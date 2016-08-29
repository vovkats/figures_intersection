class Figure
  MethodValidateError = Class.new(StandardError)
  ValidateError = Class.new(StandardError)

  def initialize
    raise ValidateError, error_message unless valid?
  end

  private

  def valid?
    raise MethodValidateError, 'Need to implement method valid?'
  end

  private

  def error_message
    ''
  end
end
