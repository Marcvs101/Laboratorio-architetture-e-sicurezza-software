class Game < ActiveRecord::Base
    belongs_to :user
    has_many :reviews, :dependent => :destroy
    has_many :ads, :dependent => :destroy
    has_many :reports, :dependent => :destroy

    def self.search(target)
        where("name LIKE ? OR description LIKE ? OR genre LIKE ? OR year LIKE ? OR maker LIKE ? OR pegi LIKE ?", target[:parameter], target[:parameter], target[:parameter], target[:parameter], target[:parameter], target[:parameter])
    end
end
