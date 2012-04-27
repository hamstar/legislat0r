module SectionsHelper

  def render_sections(sections)

    sections.each do |section|
    	render :partial => "sections/section", :locals => { :section => section }
    	render_sections section.subsections
    end
  end

end
