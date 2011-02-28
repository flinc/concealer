class Concealer::Fallback::Nil
  def call(model, method, args)
    nil
  end
end