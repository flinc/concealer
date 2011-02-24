class Concealer::Strategy::Blacklist < Concealer::Strategy::Allow

  def initialize(blacklist)
    @blacklist = blacklist
  end

  def allow?(model, method, args)
    return false if blacklisted_methods(model).include?(method)
    super
  end

  private

  def blacklisted_methods(model)
    @blacklist[model.class] ||= []
  end
end