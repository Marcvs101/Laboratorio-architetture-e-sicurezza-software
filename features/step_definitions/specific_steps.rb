Given(/^a dummy user exists$/) do
    pending
end

Given(/^A game named "([^"]*)" doesn't exist$/) do |arg1|
    Game.where(name: arg1).length.should == 0
end

Given(/^A game named "([^"]*)" exists$/) do |arg1|
    step 'I am on the homepage'
    step 'I am logged in'
    step 'I am not banned'
    step 'A game named "ABC" doesn\'t exist'
    step 'I press "Add new Game"'
    step 'I fill in "name" with "'+arg1+'" in form "game"'
    step 'I fill in "genre" with "TestGenre" in form "game"'
    step 'I fill in "maker" with "TestMaker" in form "game"'
    step 'I fill in "description" with "TestDescription" in form "game"'
    step 'I click "Save"'
    step 'I should see "'+arg1+'"'
end
