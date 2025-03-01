class PropertiesController < ApplicationController
	def show
		@properties = Property.find params[:id]
	end
end