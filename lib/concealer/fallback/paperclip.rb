class Concealer::Fallback::Paperclip
  def value_for(model, method, args)
    ::Paperclip::Attachment.new(method, model.class.new, model.class.attachment_definitions[method])
  end
end