class Concealer::Strategy::Allow < Concealer::Strategy
  def allow?(model, method, args)
    true
  end
end