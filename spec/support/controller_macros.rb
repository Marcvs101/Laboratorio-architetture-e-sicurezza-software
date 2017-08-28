module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:admin) # Using factory girl as an example
      sign_in admin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end
  
  def login_banned
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:banned]
      banned = FactoryGirl.create(:banned)
      sign_in banned
    end
  end
end
