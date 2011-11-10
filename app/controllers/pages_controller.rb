class PagesController < ApplicationController
  # GET /Pages# GET /Pages
  # GET /Pages.xml
  def index
    @pagess = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pagess }
    end
  end

  # GET /Pages/1
  # GET /Pages/1.xml
  def show
    @pages = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /Pages/new
  # GET /Pages/new.xml
  def new
    @pages = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /Pages/1/edit
  def edit
    @pages = Page.find(params[:id])
  end

  # POST /Pages
  # POST /Pages.xml
  def create
    @pages = Page.new(params[:Page])

    respond_to do |format|
      if @pages.save
        format.html { redirect_to(@pages, :notice => 'Page was successfully created.') }
        format.xml  { render :xml => @pages, :status => :created, :location => @pages }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pages.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Pages/1
  # PUT /Pages/1.xml
  def update
    @pages = Page.find(params[:id])

    respond_to do |format|
      if @pages.update_attributes(params[:Page])
        format.html { redirect_to(@pages, :notice => 'Page was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pages.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Pages/1
  # DELETE /Pages/1.xml
  def destroy
    @pages = Page.find(params[:id])
    @pages.destroy

    respond_to do |format|
      format.html { redirect_to(Pages_url) }
      format.xml  { head :ok }
    end
  end
end
