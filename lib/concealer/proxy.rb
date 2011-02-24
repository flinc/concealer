module Concealer
  class Proxy
    instance_methods.each { |m| undef_method(m) unless m =~ /(^__|^send$|^object_id$)/ }

    def initialize(target, strategy)
      @target = target
      @strategy = strategy
    end

    protected

    def method_missing(name, *args, &block)
      if @strategy.allow?(@target, name, args)
        @target.send(name, *args, &block)
      else
        return nil
      end
    end
  end
end