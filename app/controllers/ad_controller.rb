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
		
		@ad=Ad.new(report_adparams)
		maker.ads << @ad
		@game.ads << @ad
	end

	def destroy
        @ad = Ad.find(params[:id])
        user_target = current_user
        if (user_target == nil)
            flash[:warning] = 'You must be logged in to remove ads'
            redirect_to ads_path
        elsif (user_target.games.any? {|game| game.name == @game.name} || user_target.role == 'Admin')
            @ad.destroy
            flash[:notice] = "Ad '#{@ad.name}' removed"
            redirect_to ads_path
        else
            flash[:warning] = 'cant remove a game if you have not created it'
            redirect_to ads_path
        end
    end

	

	private
        def report_adparams
        	params.require(:ad).permit(:description, :type, :location, :delivery) 
        end


end
