class FindSpotsController < ApplicationController
	def index
		@spots = Unirest.get("https://data.sfgov.org/resource/wwmu-gmzc.json").body
	end

	def weather
		@city = params[:city] 
		@state = params[:state]

		if @state && @city
			@weather_data = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{@city}%2C%20#{@state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
		else
			@weather_data = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22sanfrancisco%2C%20ca%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
		end
	end

	def search
	end

	def update
		@city = params[:city] 
		@state = params[:state]
		redirect_to "/weather?city=#{@city}&state=#{@state}"
	end

end
