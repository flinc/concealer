require 'active_support/concern'

module Concealer
  extend ActiveSupport::Concern

  autoload :Proxy,    'concealer/proxy'
  autoload :Strategy, 'concealer/strategy'

  def self.strategy=(strategy)
    Thread.current[:concealer_strategy] = strategy
  end

  def self.strategy
    Thread.current[:concealer_strategy] || Concealer::Strategy::Allow.new
  end

  def concealed
    Proxy.new(self, Concealer.strategy)
  end
end
