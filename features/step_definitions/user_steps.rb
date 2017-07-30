Given /^I am not logged in$/ do
    User.count.should == 0
end

And /^I am on the homepage$/ do
    visit games_path
end

When /^I press "([^\"]*)"$/ do |text|
    click_link(text)

    #User.from_omniauth(
    #    {"provider" => "Facebook", "uid" => "0",
    #    "info" => {"email" => "test@test.test", "name" => "Test Tester"},
    #    "credentials" => {"token" => "TOKEN", "expires_at" => "0"}}
    #    )
end

Then /^I should be logged in$/ do
    User.count.should == 1
end
