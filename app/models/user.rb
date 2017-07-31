class User < ActiveRecord::Base
    validates :name, presence: true
    validates :role, presence: true
    validates :email, presence: true
    has_many :reviews
    has_many :games
    has_many :ads, :dependent => :destroy
    has_many :responses, :dependent => :destroy
    has_many :reports, :dependent => :destroy

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            if (user.email == nil)
                user.email = auth.info.email
            end
            if (user.role == nil)
                user.role = "Active"
            end
            if ((User.all.length - where(role: "Banned").length < 2 || where(role: "Admin").length < 1) && user.role == "Active")
                user.role = "Admin"
            end
            user.save!
        end
    end

    def self.search(target)
        if target[:parameter] != ""
            @result = User.where("name LIKE ? OR email LIKE ?", target[:parameter], target[:parameter])
        else
            @result = User.all
        end
        if target[:role] != "Any"
            @result = @result.where("role LIKE ?", target[:role])
        end
        return @result
    end
end
