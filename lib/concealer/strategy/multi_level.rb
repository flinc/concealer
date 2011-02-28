class Concealer::Strategy::MultiLevel < Concealer::Strategy

  def initialize(current_user, levels)
    @current_user = current_user
    @levels = levels
  end

  def allow?(model, method, args)
    required_level = required_level_for(model, method, args)
    actual_level = @current_user.relation_level_to(owner_of(model))

    raise "The level #{required_level} is not valid." unless @levels.include?(required_level)
    raise "The level #{actual_level} is not valid."   unless @levels.include?(actual_level)

    return @levels.index(actual_level) <= @levels.index(required_level)
  end

  protected

  def current_user
    @current_user
  end

  def required_level_for(model, method, args)
    @levels.first
  end

  def owner_of(model)
    if model.respond_to?(:relation_level_to)
      model
    elsif model.respond_to?(:user)
      model.user
    else
      nil
    end
  end

end
