Given (/^I am on the homepage$/) do
    visit games_path
end

Given(/^I am on the test game page$/) do
    visit games_path
    step 'I press "Add new Game"'
    step 'I fill in "name" with "TestGame" in form "game"'
    step 'I fill in "genre" with "TestGenre" in form "game"'
    step 'I fill in "maker" with "TestMaker" in form "game"'
    step 'I fill in "description" with "TestDescription" in form "game"'
    step 'I click "Save"'
    click_link("More")
end

Given(/^I am on the test ad page$/) do
    step "I am on the test game page"
    step 'I press "Add ad"'
    step 'I fill in "location" with "TestLocation" in form "ad"'
    step 'I fill in "description" with "TestDescription" in form "ad"'
    step 'I fill in "delivery" with "TestDelivery" in form "ad"'
    step 'I click "Create Ad"'
    click_link("See more")
end

Given(/^I am on the test review page$/) do
    step "I am on the test game page"
    step 'I press "Add review"'
    step 'I fill in "description" with "TestDescription" in form "review"'
    step 'I click "Create Review"'
    click_link("Read more")
end

Given(/^I am on the dummy user page$/) do
    pending
end
