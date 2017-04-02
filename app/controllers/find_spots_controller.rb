class FindSpotsController < ApplicationController
	def index
		@spots = Unirest.get("https://data.sfgov.org/resource/wwmu-gmzc.json").body

	end

end
