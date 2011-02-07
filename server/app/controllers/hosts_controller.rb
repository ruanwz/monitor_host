require 'time'
class HostsController < ApplicationController
  # GET /hosts
  # GET /hosts.xml
  def index
    @hosts = Host.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hosts }
    end
  end

  # GET /hosts/1
  # GET /hosts/1.xml
  def show
    @host = Host.find(params[:id])
    al_1=[]
    al_5=[]
    al_15=[]
    @host.records.each do |r|
      al_1<< [Time.parse(r.record_at).to_i*1000, r.average_load_1]
      al_5<< [Time.parse(r.record_at).to_i*1000, r.average_load_5]
      al_15<< [Time.parse(r.record_at).to_i*1000, r.average_load_15]

    end
    time=Time.now
    @h = LazyHighCharts::HighChart.new('graph') do |f|
        f.title :text=>"All average load data"
        f.y_axis :title=> {:text => "Values"}
        f.options[:x_axis]={:type=>"datetime"}
        f.options[:chart]={:zoomType=>"x"}
        f.series(:name=>'Average Load 1 min', :data=> al_1 )
        f.series(:name=>'Average Load 5 min', :data=> al_5 )
        f.series(:name=>'Average Load 15 min', :data=> al_15 )
      end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @host }
    end
  end

  # GET /hosts/new
  # GET /hosts/new.xml
  def new
    @host = Host.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @host }
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
    current_user.hosts << @host

    respond_to do |format|
      if @host.save
        format.html { redirect_to(@host, :notice => 'Host was successfully created.') }
        format.xml  { render :xml => @host, :status => :created, :location => @host }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hosts/1
  # PUT /hosts/1.xml
  def update
    @host = Host.find(params[:id])

    respond_to do |format|
      if @host.update_attributes(params[:host])
        format.html { redirect_to(@host, :notice => 'Host was successfully updated.') }
        format.xml  { head :ok }
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
end
