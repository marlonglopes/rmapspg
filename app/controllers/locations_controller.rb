class LocationsController < ApplicationController

def map
	
    @location = Location.find(params[:id])
	 @res=getlocation(@location.endereco)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end

	
end

def map2
	
    @location = Location.find(params[:id])
	 @res=getlocation(@location.endereco)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end

	
end


  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show

    @location = Location.find(params[:id])

#	 @res=getlocation(@location.endereco)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new

    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
#	 @res=getlocation(@location.endereco)

  end

  # POST /locations
  # POST /locations.xml
  def create
	@location = Location.new(params[:location])

#	@res=getlocation(@location.endereco)
#	@location.lat=@res.lat
#	@location.lng=@res.lng

    respond_to do |format|
      if @location.save
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
	   @location = Location.find(params[:id])

#		@res=getlocation(@location.endereco)
#		@location.lat=@res.lat
#		@location.lng=@res.lng

    respond_to do |format|
      if @location.update_attributes(@location)
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end

private

include Geokit::Geocoders

def getlocation(endereco)

	#	geo = GoogleGeocoding::Geocoder.new(:app_key => 'ABQIAAAAKl1KirkuM9Plf64-bvK9tBR15u23_USjIvPCKdzjdDlz0gFP4hTlYussijZsRjMDXhvAtFK_p_pQrQ')
	#	res = geo.query(endereco)
	
	res=MultiGeocoder.geocode(endereco)

end


end
