class Report < ActiveRecord::Base
    attr_accessor :description
    belongs_to :user
    belongs_to :reportable
end
