module Concealer
  class Fallback

    autoload :Nil,          'concealer/fallback/nil'
    autoload :EmptyString,  'concealer/fallback/empty_string'
    autoload :Paperclip,    'concealer/fallback/paperclip'

    def value_for(model, method, args)
      raise "The fallback must implement #value_for(model, method, args)"
    end
  end
end