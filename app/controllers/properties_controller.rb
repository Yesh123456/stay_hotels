class PropertiesController < ApplicationController
	def show
		@properties = Property.find params[:id]
		@facilities = @properties.facility
	end
end