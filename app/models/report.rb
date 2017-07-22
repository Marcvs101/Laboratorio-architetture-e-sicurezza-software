class Report < ActiveRecord::Base
    validates :description, presence: true, length: { minimum: 10 }
    belongs_to :user
    belongs_to :reportable
end
