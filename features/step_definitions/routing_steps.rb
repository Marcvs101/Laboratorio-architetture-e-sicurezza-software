Given (/^I am on the homepage$/) do
    visit games_path
end

Given(/^I am on the game_page$/) do
    visit games_path
    if (Game.where(name: "TestGame").length == 1)
        click_link("More")
    else
        step 'I press "Add new Game"'
        step 'I fill in "name" with "TestGame" in form "game"'
        step 'I fill in "genre" with "TestGenre" in form "game"'
        step 'I fill in "maker" with "TestMaker" in form "game"'
        step 'I fill in "description" with "TestDescription" in form "game"'
        step 'I click "Save"'
        click_link("More")
    end
end

Given(/^I am on the ad_page$/) do
    pending
end

Given(/^I am on the review_page$/) do
    pending
end

Given(/^I am on the user_page$/) do
    pending
end
