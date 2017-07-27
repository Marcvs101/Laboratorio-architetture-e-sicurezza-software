class AdController < ApplicationController
	
	def index
		@ads=Ad.all
	end
	
	def show
        	id = params[:id]
        	@ad = Ad.find(id)
	end

	def new   
    	end

	def create
		@game=Game.find[:game_id]
		maker = current_user
        		if maker == nil
        			flash[:warning] = 'You must be logged in to add ads'
        			redirect_to ads_path
        		end
		
		@ad=Ad.new(ad_params)
		maker.ads << @ad
		@game.ads << @ad
		@ad.save
	end

	def destroy
            @ad = Ad.find(params[:id])
            user_target = current_user
            if (user_target == nil)
                flash[:warning] = 'You must be logged in to remove ads'
                redirect_to ads_path
            elsif (user_target.ad.any? {|ad| ad.id == @ad.id} || user_target.role == 'Admin')
                @ad.destroy
                flash[:notice] = "Ad removed"
                redirect_to ads_path
            else
                flash[:warning] = 'cant remove an ad if you have not created it'
                redirect_to ads_path
            end
	end

	

	private
        def ad_params
        	params.require(:ad).permit(:description, :type, :location, :delivery) 
        end


end
