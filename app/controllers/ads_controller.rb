class AdsController < ApplicationController

	def show
        id = params[:id]
        @ad = Ad.find(id)
        @game = Game.find(params[:game_id])
        @person = @ad.user.name
	end

	def new
        @game = Game.find(params[:game_id])
        maker = current_user
        if maker == nil
            flash[:warning] = 'You must be logged in to add ads'
            redirect_to game_reviews_path(@game)
        elsif (maker.ads.any? {|ad| ad.game.id == @game.id})
            flash[:warning] = 'You have already created an ad for this game'
            redirect_to game_reviews_path(@game)
        else
            @ad = @game.ads.build
    	end
    end

	def create
        params.require(:ad)
        params.permit!

        @game=Game.find(params[:game_id])

        if (params[:ad][:location].length == 0)
            flash[:warning] = 'Location cant be blank'
            redirect_to game_reviews_path(@game)
        else
            maker = current_user
            maker.ads << @game.ads.build(params[:ad])
            redirect_to game_reviews_path(@game)
        end
	end

	def destroy
            @ad = Ad.find(params[:id])
            @game=Game.find(params[:game_id])
            user_target = current_user
            if (user_target == nil)
                flash[:warning] = 'You must be logged in to remove ads'
                redirect_to game_reviews_path(@game)
            elsif (user_target.ads.any? {|ad| ad.id == @ad.id} || user_target.role == 'Admin')
                @ad.destroy
                flash[:notice] = "Ad removed"
                redirect_to game_reviews_path(@game)
            else
                flash[:warning] = 'cant remove an ad if you have not created it'
                redirect_to game_reviews_path(@game)
            end
	end
end
