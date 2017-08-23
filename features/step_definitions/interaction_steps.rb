When (/^I press "([^\"]*)"$/) do |text|
    click_link(text)
end

When (/^I click "([^\"]*)"$/) do |text|
    click_button(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)" in form "([^"]*)"$/) do |arg1, arg2, arg3|
    fill_in ""+arg3+"["+arg1+"]", with: arg2
end
