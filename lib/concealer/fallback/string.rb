class Concealer::Fallback::String

  def initialize(value = "")
    @value = value
  end

  def call(model, method, args)
    @value
  end
end
