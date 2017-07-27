class User < ActiveRecord::Base
    has_many :reviews, :dependent => :destroy
    has_many :games, :dependent => :destroy
    has_many :ads
    has_many :responses
    has_many :reports

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            if (user.role == nil)
                user.role = "Active"
            end
            if (User.all.length < 2 || where(role: "Admin").length < 1)
                user.role = "Admin"
            end
            user.save!
        end
    end

    def self.search(target)
        where("name LIKE ?", "%#{target}%")
        where("lastname LIKE ?", "%#{target}%")
        where("email LIKE ?", "%#{target}%")
    end

    def self.filterByRole(target)
        where(role: target)
    end
end
