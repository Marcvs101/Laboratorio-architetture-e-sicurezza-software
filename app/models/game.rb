class Game < ActiveRecord::Base
    def self.all_pegi ; %w[3 7 12 16 18] ; end

    validates :name, presence: true
    validates :description, presence: true
    validates :maker, presence: true
    validates :genre, presence: true
    validates :pegi, :inclusion => {:in => Game.all_pegi}
    validates :year, presence: true
    belongs_to :user
    has_many :reviews, :dependent => :destroy
    has_many :ads, :dependent => :destroy
    has_many :reports, :dependent => :destroy

    def self.search(target)
        where("name LIKE ? OR description LIKE ? OR genre LIKE ? OR year LIKE ? OR maker LIKE ? OR pegi LIKE ?", target[:parameter], target[:parameter], target[:parameter], target[:parameter], target[:parameter], target[:parameter])
    end
end
