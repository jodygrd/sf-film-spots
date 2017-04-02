Rails.application.routes.draw do

	get "/spots" => "find_spots#index"
	get "/weather" => "find_spots#weather"
	
	get "/search" => "find_spots#search"
	post "/weather" => "find_spots#weather"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
