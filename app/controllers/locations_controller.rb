class LocationsController < InheritedResources::Base

  private

    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
    
end
