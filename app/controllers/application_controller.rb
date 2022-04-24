class ApplicationController < ActionController::Base
  def street_to_coords_form
  render("weather_templates/street_to_coords_form.html.erb")
  end

  def street_to_coords_results
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}

    @street_address = params.fetch("user_street_address")

    @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

    @raw_json_string = open(@maps_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results_array = @parsed_json.fetch("results")

    @first_result = @results_array.at(0)
    
    @geometry_hash = @first_result.fetch("geometry")

    @location_hash = @geometry_hash.fetch("location")

    @latitude = @location_hash.fetch("lat")
    @longitude = @location_hash.fetch("lng")

    render("weather_templates/street_to_coords_results.html.erb")
  end

  def coords_to_weather_form
    render("weather_templates/coords_to_weather_form.html.erb")
  end
  
  def coords_to_weather_results
      # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}
  
      @lat = params.fetch("lat")
      @lon = params.fetch("lon")
  
      @weather_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/"+@lat+","+@lon
      @raw_json_string = open(@weather_url).read
  
      @parsed_json = JSON.parse(@raw_json_string)
  
      @current_array = @parsed_json.fetch("currently")
  
      @temp = @current_array.fetch("temperature")
      @summary = @current_array.fetch("summary")
      @mins= @parsed_json.fetch("minutely").fetch("summary")
      @hours= @parsed_json.fetch("hourly").fetch("summary")
      @days= @parsed_json.fetch("daily").fetch("summary")

      render("weather_templates/coords_to_weather_results.html.erb")
  end
    
  def street_to_weather_form
  render("weather_templates/street_to_weather_form.html.erb")
  end

  def street_to_weather_results
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}

    @street_address = params.fetch("user_street_address")

    @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

    @raw_json_string = open(@maps_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results_array = @parsed_json.fetch("results")

    @first_result = @results_array.at(0)
    
    @geometry_hash = @first_result.fetch("geometry")

    @location_hash = @geometry_hash.fetch("location")

    @latitude = @location_hash.fetch("lat").to_s
    @longitude = @location_hash.fetch("lng").to_s

    @weather_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/"+@latitude+","+@longitude
      @raw_json_string_weather = open(@weather_url).read
  
      @parsed_json_weather = JSON.parse(@raw_json_string_weather)
  
      @current_array = @parsed_json_weather.fetch("currently")
  
      @temp = @current_array.fetch("temperature")
      @summary = @current_array.fetch("summary")
      @mins= @parsed_json_weather.fetch("minutely").fetch("summary")
      @hours= @parsed_json_weather.fetch("hourly").fetch("summary")
      @days= @parsed_json_weather.fetch("daily").fetch("summary")

    render("weather_templates/street_to_weather_results.html.erb")
  end
end
