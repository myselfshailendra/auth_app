module Pages
  class Login < Basic

    def visit_page
      page_url = '/sign_in'
      visit page_url
      self
    end

    def fill_details(details)
      details.each do |field|
        fill_in "#{field[0]}", with: field[1] unless field[0].eql?(:accept_terms)
      end
      click_on 'sign in'
    end

    def has_error?(error)
      has_css? '.signin-page span', text: error
    end

    def with_blank_details
      {
          email: '',
          password: '',
      }
    end

    def with_incorrect_email
      {
          email: 'wrongemail@mailinator.com',
          password: 'Abc@1234',
      }
    end

    def with_incorrect_password
      {
          email: 'user@mailinator.com',
          password: 'IncorrectPassword',
      }
    end

    def with_correct_credentials
      {
          email: 'user@mailinator.com',
          password: 'Abc@1234',
      }
    end
  end
end
