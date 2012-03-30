require 'active_support/concern'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/module/attribute_accessors'

module Concealer
  extend ActiveSupport::Concern

  autoload :Proxy,    'concealer/proxy'
  autoload :Strategy, 'concealer/strategy'
  autoload :Fallback, 'concealer/fallback'

  ##
  # :singleton-method: default_fallback=
  # :call-seq:
  #   default_fallback=(fallback)
  #

  ##
  # :singleton-method: default_fallback
  # Returns the set default fallback. If not explicitly set to something else
  # it is Concealer::Fallback::Nil.
  mattr_accessor :default_fallback
  @@default_fallback = Concealer::Fallback::Nil.new

  ##
  # Sets the strategy concealer uses to check permissions
  #
  def self.strategy=(strategy)
    Thread.current[:concealer_strategy] = strategy
  end

  ##
  # Returns the strategy that's set for concealer. Default is Concealer::Strategy::Allow
  #
  def self.strategy
    Thread.current[:concealer_strategy] || Concealer::Strategy::Allow.new
  end

  ##
  # Executes the block with the given strategy.
  #
  def self.with_strategy(strategy)
    save, self.strategy = self.strategy, strategy
    yield
    self.strategy = save
  end

  ##
  # Registers a new fallback for the given method on the given model
  #
  def self.register_fallback(model, method, fallback)
    name = model.is_a?(Symbol) ? model : model.to_s.to_sym
    @@fallbacks ||= {}
    @@fallbacks[name] ||= {}
    @@fallbacks[name][method] = fallback
  end

  ##
  # Returns the set fallback for the given method on the given model
  # If none is set it returns the default fallback set with Concealer.default_fallback=
  #
  def self.fallback_for(model, method)
    @@fallbacks ||= {}
    @@fallbacks.try(:[], model.class.to_s.to_sym).try(:[], method.to_sym) || @@default_fallback
  end

  ##
  # Accesses the current object using Concealer to check method calls
  #
  # Example:
  #   Concealer.strategy = Concealer::Strategy::Deny.new
  #   user = User.new(:name => "Christian")
  #   user.name # => Christian
  #   user.concealed.name # => nil
  #
  def concealed
    @concealed ||= Proxy.new(self, Concealer.strategy)
  end
end
