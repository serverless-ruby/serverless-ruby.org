module ApplicationHelper
  # stolen from https://github.com/hotwired/turbo-rails/blob/main/app/helpers/turbo/frames_helper.rb#L23
  def turbo_frame_tag(id, src: nil, target: nil, **attributes, &block)
    id = id.respond_to?(:to_key) ? dom_id(id) : id

    tag.turbo_frame(**attributes.merge(id: id, src: src, target: target).compact, &block)
  end

  def error_message(model, field)
    if model.errors.any?
      tag.div(model.errors.full_messages_for(field).join(', '), class: "form-text text-danger", id: help_tag_id(field))
    end
  end

  def help_tag(description, field)
    tag.div(description, class: "form-text", id: help_tag_id(field))
  end

  def help_tag_id(field)
    "#{field}-help"
  end

  def flash_notice
    if flash[:notice]
      tag.div flash[:notice], class: "alert alert-warning", role: "alert"
    end
  end
end
