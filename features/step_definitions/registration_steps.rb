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

When(/^I enter submit form with (.*?)$/) do |type|
  details = case type
            when 'blank details'
              @registration_page.with_blank_details
            when 'wrong email format'
              @registration_page.with_wrong_email_format
            when 'less password length'
              @registration_page.with_less_password_length
            when 'invalid password'
              @registration_page.with_invalid_password
            when 'mismatched password'
              @registration_page.with_mismatched_password
            when 'correct details without accepting term'
              @registration_page.with_details_without_term
            when 'correct details with accepting term'
              @registration_page.with_details_with_term
            end
  @registration_page.fill_details(details)
end

Then(/^I should see (.*?) errors$/) do |type|
  case type
  when 'blank'
    expect(@registration_page).to have_error('Email address can\'t be blank, Email address is invalid')
    expect(@registration_page).to have_error('Password can\'t be blank, Password is too short (minimum is 8 characters), Password is invalid')
    expect(@registration_page).to have_error('Please accept terms')
  when 'wrong email format'
    expect(@registration_page).to have_error('Email address is invalid')
  when 'password length'
    expect(@registration_page).to have_error('Password is too short (minimum is 8 characters), Password is invalid')
  when 'invalid password'
    expect(@registration_page).to have_error('Password is invalid')
  when 'mismatched password'
    expect(@registration_page).to have_error('doesn\'t match Password')
  when 'terms'
    expect(@registration_page).to have_error('Please accept terms')
  end
end

Then(/^I will be on login page$/) do
  sleep 1
  expect(User.last.email).to eq('demo@mailinator.com')
  expect(@registration_page).to have_current_path('/sign_in')
end
