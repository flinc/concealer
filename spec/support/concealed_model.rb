class ConcealedModel
  include Concealer

  def allowed_method
    :allowed_method
  end

  def denied_method
    :denied_method
  end
end