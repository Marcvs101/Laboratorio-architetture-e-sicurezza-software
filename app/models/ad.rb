class Ad < ActiveRecord::Base
    validates :description, presence: true
    validates :location, presence: true
    validates :delivery, presence: true
    validates :tipo, presence: true
    belongs_to :user
    belongs_to :game
    has_many :reports, :dependent => :destroy
    has_many :responses, :dependent => :destroy
end
