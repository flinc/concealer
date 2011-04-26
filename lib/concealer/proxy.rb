module Concealer
  class Proxy
    instance_methods.each { |m| undef_method(m) unless m =~ /(^__|^send$|^object_id$)/ }

    def initialize(target, strategy)
      @target = target
      @strategy = strategy
    end

    protected

    def method_missing(name, *args, &block)

      check_concealed = /(.+)_concealed\?$/.match(name.to_s).try(:[], 1).try(:to_sym)
      
      if check_concealed && @target.respond_to?(check_concealed)
        return !@strategy.allow?(@target, check_concealed, args)
      end
      
      if !@target.respond_to?(name)
        raise NoMethodError, "#{@target} does not respond to #{name}"
      elsif @strategy.allow?(@target, name, args)
        @target.send(name, *args, &block)
      else
        Concealer.fallback_for(@target, name).call(@target, name, args)
      end
    end
  end
end
