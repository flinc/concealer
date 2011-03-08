class Concealer::Strategy::All < Concealer::Strategy
  def initialize(*strategies)
    @strategies = strategies.flatten
  end

  def allow?(model, method, args)
    @strategies.all? { |s| s.allow?(model, method, args) }
  end
end
