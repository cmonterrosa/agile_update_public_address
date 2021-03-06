class HostsController < ApplicationController
  before_filter :authenticate
  # GET /hosts
  # GET /hosts.xml
  def index
    @hosts = Host.find(:all, :order => "nombre")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hosts }
      format.json { render :json => @hosts }
    end
  end

  # GET /hosts/1
  # GET /hosts/1.xml
  def show
    @host = Host.find(params[:id]) if params[:id]=~/^\d{1,6}$/
    @host ||= Host.find_by_nombre(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @host }
      format.json  { render :json => @host }
    end
  end

  # GET /hosts/new
  # GET /hosts/new.xml
  def new
    @host = Host.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @host }
      format.json  { render :json => @host }
    end
  end

  # GET /hosts/1/edit
  def edit
    @host = Host.find(params[:id])
  end

  # POST /hosts
  # POST /hosts.xml
  def create
    @host = Host.new(params[:host])

    respond_to do |format|
      if @host.save
        format.html { redirect_to(@host, :notice => 'Host was successfully created.') }
        format.xml  { render :xml => @host, :status => :created, :location => @host }
        format.json  { render :json => @host, :status => :created, :location => @host }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hosts/1
  # PUT /hosts/1.xml
  def update
    @host = Host.find(:first, :conditions => ["nombre = ?", params[:id]])
    respond_to do |format|
      if @host.update_attributes!(params[:host])
        logger.info("=> #{Time.now} Updated Host ##{@host.nombre}!")
        format.html { redirect_to(@host, :notice => 'Host was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /hosts/1
  # DELETE /hosts/1.xml
  def destroy
    @host = Host.find(params[:id])
    @host.destroy

    respond_to do |format|
      format.html { redirect_to(hosts_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def authenticate
    @config = YAML.load_file("#{RAILS_ROOT}/config/database.yml")
    authenticate_or_request_with_http_basic do |username, password|
      username == @config[RAILS_ENV]["app_user"] && password == @config[RAILS_ENV]["app_password"]
    end
  end

end
