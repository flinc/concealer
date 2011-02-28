class Concealer::Fallback::EmptyString
  def call(model, method, args)
    ""
  end
end