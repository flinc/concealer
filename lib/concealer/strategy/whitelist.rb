class Concealer::Strategy::Whitelist < Concealer::Strategy::Deny

  def initialize(whitelist)
    @whitelist = whitelist
  end

  def allow?(model, method, args)
    return true if whitelisted_methods(model).include?(method)
    super
  end

  private

  def whitelisted_methods(model)
    @whitelist[model.class] ||= []
  end
end