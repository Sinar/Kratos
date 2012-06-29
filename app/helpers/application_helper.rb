require 'kramdown'

module ApplicationHelper

  def markdown(html)
    return Kramdown::Document.new(html, :input => 'html').to_kramdown
  end

  def markup(text)
    return Kramdown::Document.new(text).to_html.html_safe
  end

end
