module ApplicationHelper

	def convert_from_markdown(text)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
  	markdown = Redcarpet::Markdown.new(renderer, underline: true, lax_spacing: true, autolink: true)
  	return markdown.render(text).html_safe
  end

end
