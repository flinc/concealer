module Concealer
  class Fallback

    autoload :Nil,          'concealer/fallback/nil'
    autoload :EmptyString,  'concealer/fallback/empty_string'
    autoload :Paperclip,    'concealer/fallback/paperclip'

    def call(model, method, args)
      raise "The fallback must implement #call(model, method, args)"
    end
  end
end