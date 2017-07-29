class Ad < ActiveRecord::Base
    belongs_to :user
    belongs_to :game
    has_many :reports, :dependent => :destroy
    has_many :responses, :dependent => :destroy
end
