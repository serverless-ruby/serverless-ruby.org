module ApplicationHelper
  # stolen from https://github.com/hotwired/turbo-rails/blob/main/app/helpers/turbo/frames_helper.rb#L23
  def turbo_frame_tag(id, src: nil, target: nil, **attributes, &block)
    id = id.respond_to?(:to_key) ? dom_id(id) : id

    tag.turbo_frame(**attributes.merge(id: id, src: src, target: target).compact, &block)
  end
end
