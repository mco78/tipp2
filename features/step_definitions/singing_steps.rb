Given /^there is a registered user with email "(.*?)"$/ do |email|
  @user = FactoryGirl.create(:user, email:email)
end

Given /^I am on the sign in page$/ do
  visit user_session_path
end

When /^I enter correct credentials$/ do
  fill_in "user_username", with: @user.username
  fill_in "user_password", with: @user.password
end

When /^I press the sign in button$/ do
  click_button "anmelden"
end

Then /^the flash message should be "(.*?)"$/ do |text|
  page.should have_content text
end