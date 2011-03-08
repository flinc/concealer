class Concealer::Strategy::Any < Concealer::Strategy
  def initialize(*strategies)
    @strategies = strategies.flatten
  end

  def allow?(model, method, args)
    @strategies.any? { |s| s.allow?(model, method, args) }
  end
end
