class Concealer::Fallback::Nil
  def value_for(model, method, args)
    nil
  end
end