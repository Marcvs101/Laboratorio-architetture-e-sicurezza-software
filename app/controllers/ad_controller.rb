class AdController < ApplicationController
	
	def index
		@ads=Ad.all
	end
	
	def show
        	id = params[:id]
        	@ad = Ad.find(id)
	end

	def new
        maker = current_user
        	if maker == nil
        		flash[:warning] = 'You must be logged in to add ads'
        		redirect_to ads_path
        	end
        @ad = Ad.new
    	end

	def show
		@ad = Ad.find(params[:id])

	def create
	end


end
