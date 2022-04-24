Rails.application.routes.draw do
  get("/add", {:controller=>"math", :action=>"addition_form"})
  get("/wizard_add", {:controller=>"math", :action=>"addition_results"})

  get("/subtract", {:controller=>"math", :action=>"subtraction_form"})
  get("/wizard_subtract", {:controller=>"math", :action=>"subtraction_results"})

  get("/multiply", {:controller=>"math", :action=>"multiplication_form"})
  get("/wizard_multiply", {:controller=>"math", :action=>"multiplication_results"})

  get("/divide", {:controller=>"math", :action=>"division_form"})
  get("/wizard_divide", {:controller=>"math", :action=>"division_results"})

  get("/street_to_coords/new", { :controller => "application", :action => "street_to_coords_form" })
  get("/wizard_street_to_coords", { :controller => "application", :action => "street_to_coords_results" })

  get("/coords_to_weather/new", { :controller => "application", :action => "coords_to_weather_form" })
  get("/wizard_coords_to_weather", { :controller => "application", :action => "coords_to_weather_results" })

  get("/street_to_weather/new", { :controller => "application", :action => "street_to_weather_form" })
  get("/wizard_street_to_weather", { :controller => "application", :action => "street_to_weather_results" })

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
