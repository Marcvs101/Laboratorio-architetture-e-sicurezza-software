class User < Reportable
    include ActiveModel::SecurePassword
    has_secure_password
    has_many :games
    has_many :ads
    has_many :reviews
    has_many :responses

    def self.search(target)
        where("name LIKE ?", "%#{target}%")
        where("lastname LIKE ?", "%#{target}%")
        where("email LIKE ?", "%#{target}%")
    end

    def self.filterByRole(target)
        where(role: target)
    end
end
