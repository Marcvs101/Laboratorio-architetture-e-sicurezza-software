require 'spec_helper'

RSpec.describe Game, :type => :model do
    before(:each) do
    @valid_game = Game.new(name: 'A Random Game',
                            description: 'boh',
                            genre: 'boh',
                            maker: 'boh',
                            pegi: '18',
                            year: '2000-01-01')
    end

    it "is valid" do
        expect(@valid_game).to be_valid
    end
    it "is invalid without a name" do
        @valid_game.name = nil
        expect(@valid_game).not_to be_valid
    end
    it "is invalid without a description" do
        @valid_game.description = nil
        expect(@valid_game).not_to be_valid
    end
    it "is invalid without a genre" do
        @valid_game.genre = nil
        expect(@valid_game).not_to be_valid
    end
    it "is invalid without a pegi" do
        @valid_game.pegi = nil
        expect(@valid_game).not_to be_valid
    end
    it "is invalid without a maker" do
        @valid_game.maker = nil
        expect(@valid_game).not_to be_valid
    end
    it "is invalid without a year" do
        @valid_game.year = nil
        expect(@valid_game).not_to be_valid
    end
    it "has unique name" do
        @valid_game.save
        duplicate_game = Game.new(name: 'A Random Game',
                            description: 'boh2',
                            genre: 'boh2',
                            maker: 'boh2',
                            pegi: '18',
                            year: '2000-01-01')
        expect(duplicate_game.save).to eq(false)
    end
end
