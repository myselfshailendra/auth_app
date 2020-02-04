Given(/^I will hit signup url$/) do
  @registration = Pages::Registration.new
  @registration_page = @registration.visit_page
end

Then(/^I should see the registration form$/) do
  expect(@registration_page).to have_heading('Sign Up')
end

And(/^I should see input fields$/) do
  expect(@registration_page).to have_css("input[id='user_email']")
  expect(@registration_page).to have_css("input[id='user_password']")
  expect(@registration_page).to have_css("input[id='user_password_confirmation']")
end

And(/^I should see the signin link on the form$/) do
  expect(@registration_page).to have_link('Sign In')
end
