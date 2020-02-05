def create_user
  @create_user ||= FactoryBot.create(:user, email: 'user@mailinator.com', password: 'Abc@1234', password_confirmation: 'Abc@1234', accept_terms: '1')
end

Given(/^I seeded up data$/) do
  create_user
  @login = Pages::Login.new
  @login_page = @login.visit_page
end

Then(/^I am on the login page$/) do
  expect(@login_page).to have_heading('Sign In')
end

When(/^I sign in with (.*?)$/) do |type|
  details = case type
            when 'blank credentials'
              @login_page.with_blank_details
            when 'incorrect email'
              @login_page.with_incorrect_email
            when 'incorrect password'
              @login_page.with_incorrect_password
            when 'correct credentials'
              @login_page.with_correct_credentials
            end
  @login_page.fill_details(details)
end

Then(/^I should see the invalid credentials error$/) do
    expect(@login_page).to have_error('Invalid credentials!')
end

Then(/^I should see the dashboard page$/) do
  sleep 1
  expect(@login_page).to have_current_path('/dashboard')
end

Then(/^I click on logout$/) do
  click_link('SignOut')
end