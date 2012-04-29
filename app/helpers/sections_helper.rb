module SectionsHelper

  def render_sections(sections)

    sections.each do |section|
    	render :partial => "sections/section", :locals => { :section => section }
    	render_sections section.subsections
    end
  end

  def markdown(text)
  	text
    # renderer = Redcarpet::Render::HTML.new({
    #   :filter_html => true,
    #   :hard_wrap => true
    # })
    # markdown = Redcarpet::Markdown.new(renderer, {
    #   :autolink => true,
    #   :no_intra_emphasis => true
    # })

    # markdown.render(text).html_safe
  end

end
