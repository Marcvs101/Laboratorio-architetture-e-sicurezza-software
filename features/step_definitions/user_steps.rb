Given(/^I am logged in$/) do
    visit games_path
    if (have_text("Sign in with Facebook"))
        click_link("Sign in with Facebook")
    end
    expect(page).to have_text("Welcome")
end

Given(/^I am not banned$/) do
    visit games_path
    expect(page).to have_text("Listing Games")
end

Given(/^I am admin$/) do
    visit games_path
    expect(page).to have_text("Administration Panel")
end
