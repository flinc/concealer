class Concealer::Fallback::EmptyString
  def value_for(model, method, args)
    ""
  end
end