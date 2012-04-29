class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find(params[:id])
    @parent = @section.parent
    @current_revision = @section.get_current_revision

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => {
          section: @section,
          parent: @parent,
          current_revision: @current_revision
        } 
      }
    end
  end

  def activities
    @section = Section.find(params[:id])
    @objects = Array.new
    @objects += @section.revisions
    @objects += @section.comments
    @objects.sort_by( &:created_at )

    render :json => {
      :html => (render_to_string :partial => "activities", :locals => {:objects => @objects })
    }
  end

  def add
    @section = Section.new(
      :bill_id => params[:bill_id],
      :title => params[:title]
    )
    @section.save

    @revision = Revision.new(
      :markup => params[:markup], 
      :comment => "New section called " + params[:title],
      :section => @section
    )
    @revision.save
    
    @section.current_revision @revision
    @section.save

    @bill = Bill.find params[:bill_id]

    respond_to do |format|
      format.html { redirect_to @bill, notice: 'Section was successfully created.' }
      format.json { render json: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @section = Section.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  def edit_form
    @section = Section.find(params[:id])

    render :json => {
      :html => (render_to_string :partial => "form", :locals => {:section => @section })
    }
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    if Digest::MD5.hexdigest(@section.get_markup) != Digest::MD5.hexdigest(params[:markup])
      @revision = Revision.new(
        :markup => params[:markup], 
        :comment => params[:comment],
        :section => @section
      )
      @revision.save
      
      @section.current_revision @revision
      @section.save
    end

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :json => {
          :html => (render_to_string :partial => "section", :formats => [:html], :locals => {:section => @section })
        }}
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end
end
