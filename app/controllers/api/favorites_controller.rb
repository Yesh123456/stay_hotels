module Api
	class FavoritesController < ApplicationController
		protect_from_forgery with: :null_session

		def create
			@favorite = Favorite.create!(favorite_params)
			respond_to do |format|
				format.json { render json: @favorite.to_json, status: :ok, message: 'Property added to Favorites' }
			end
		end

		def destroy
			@favorite = Favorite.find_by(id: params[:id])
			if @favorite
				@favorite.destroy!
				respond_to do |format|
				  format.json { render json: { success: 'Property removed from Favorites' }, status: :no_content} # 204 No Content is appropriate for deletions
				end
			else
				respond_to do |format|
				  format.json { render json: { error: 'Failed to remove Property from Favorites' }, status: :not_found }
				end
			end
		end

		private

		def favorite_params
			params.permit(:user_id, :property_id)
		end
	end
end