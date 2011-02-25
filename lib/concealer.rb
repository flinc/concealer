require 'active_support/concern'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/module/attribute_accessors'

module Concealer
  extend ActiveSupport::Concern

  autoload :Proxy,    'concealer/proxy'
  autoload :Strategy, 'concealer/strategy'
  autoload :Fallback, 'concealer/fallback'

  mattr_accessor :default_fallback
  @@default_fallback = Concealer::Fallback::Nil.new

  def self.strategy=(strategy)
    Thread.current[:concealer_strategy] = strategy
  end

  def self.strategy
    Thread.current[:concealer_strategy] || Concealer::Strategy::Allow.new
  end

  def self.with_strategy(strategy)
    save, self.strategy = self.strategy, strategy
    yield
    self.strategy = save
  end

  def self.register_fallback(model, method, fallback)
    @@fallbacks ||= {}
    @@fallbacks[model.to_s.to_sym] ||= {}
    @@fallbacks[model.to_s.to_sym][method] = fallback
  end

  def self.fallback_for(model, method)
    @@fallbacks ||= {}
    @@fallbacks.try(:[], model.class.to_s.to_sym).try(:[], method.to_sym) || @@default_fallback
  end

  def concealed
    Proxy.new(self, Concealer.strategy)
  end
end
