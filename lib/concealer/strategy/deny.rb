class Concealer::Strategy::Deny < Concealer::Strategy
  def allow?(model, method, args)
    false
  end
end