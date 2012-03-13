require 'active_support/core_ext/hash'

class Concealer::Fallback::Paperclip
  def call(model, method, args)
    attachment_definitions = model.class.attachment_definitions.with_indifferent_access
    ::Paperclip::Attachment.new(method, model.class.new, attachment_definitions[method])
  end
end
