class GamesController < ApplicationController
    def index
        @games = Game.all
    end
    
    def show
        id = params[:id]
        @game = Game.find(id)
    end
    
    def new
        @game = Game.new
    end
    
    def create
        params.require(:game)
        params.permit!
        
        #controllo: il nome non deve essere già presente
        valid = true
        array = Game.all
        array.each do |game|
            if game.name == params[:game][:name]
                flash[:warning] = "#{params[:game][:name]} already exist"
                valid = false
            end
        end
        
        #controllo: i campi non devono essere vuoti
        if params[:game][:name].length == 0
            flash[:warning] = "Name cant be blank"
            valid = false
        
        elsif params[:game][:genre].length == 0
            flash[:warning] = "Genre cant be blank"
            valid = false
        
        elsif params[:game][:maker].length == 0
            flash[:warning] = "Maker cant be blank"
            valid = false
        
        #elsif params[:game][:year].length == 0
        #    flash[:warning] = "Year cant be blank"
        #    valid = false
        
        elsif params[:game][:description].length == 0
            flash[:warning] = "Description cant be blank"
            valid = false
        end
        
        #
        if valid
            @game = Game.create!(params[:game])
            flash[:notice] = "#{@game.name} was added"
        end
        redirect_to games_path
    end
    
    def edit
        @game = Game.find params[:id]
    end
    
    def update
        params.require(:game)
        params.permit!
        @game = Game.find params[:id]
        @game.update_attributes!(params[:game])
        flash[:notice] = "#{@game.name} was successfully updated"
        redirect_to game_path(@game)
    end
    
    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        flash[:notice] = "Game '#{@game.name}' removed"
        redirect_to games_path
    end
        
end
