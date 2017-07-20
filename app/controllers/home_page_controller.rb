class HomePageController < ApplicationController
    def home
    end

    def search
        @games = Game.all
        @debugres = ""
        if params[:search]
            @games = Game.search(params[:search]).order(:name)
            @debugres = "1"
        else
            @games = Game.all.order(:name)
            @debugres = "2"
        end
    end
end
