Given /^I am not logged in$/ do
    @before = User.count
    User.where(name: "John Doe").length.should == 0
end

And /^I am on the homepage$/ do
    visit games_path
end

When /^I press "([^\"]*)"$/ do |text|
    click_link(text)
end

Then /^I should be logged in$/ do
    User.count.should == @before + 1
    User.where(name: "John Doe").length.should == 1
end
