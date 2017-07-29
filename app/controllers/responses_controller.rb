class ResponsesController < ApplicationController
    def index
        user_target = current_user
        @responses = []
        user_target.ads.each do |ad|
            ad.responses.each do |response|
                @responses.append(response)
            end
        end
    end
    
    def show
        @response = Response.find(params[:id])
    end
    
    def new
        @ad = Ad.find(params[:ad_id])
        @response = @ad.responses.build
    end
    
    def create
        @ad = Ad.find(params[:ad_id])
        maker = current_user
        if (maker.responses.any? {|response| response.ad.id == @ad.id})
            flash[:warning] = 'You have already responded to that ad'
        else
            maker.responses << @ad.responses.build
            flash[:notice] = 'Messaggio inviato'
        end
        redirect_to game_reviews_path(@ad.game)
    end
    
    def destroy
        @response = Response.find(params[:id])
        @response.destroy
        flash[:notice] = 'Message deleted'
        redirect_to responses_path
    end

end
