module Pages
  class Registration < Basic

    def visit_page
      page_url = '/sign_up'
      visit page_url
      self
    end

    def fill_details(details)
      details.each do |field|
        fill_in "user_#{field[0]}", with: field[1] unless field[0].eql?(:accept_terms)
      end
      execute_script("$('#user_accept_terms').click()") if details[:accept_terms].eql?('1')
      click_on 'signup'
    end

    def has_error?(error)
      has_css? '#signup-page span', text: error
    end

    def with_blank_details
      {
          email: '',
          password: '',
          password_confirmation: '',
          accept_terms: ''
      }
    end

    def with_wrong_email_format
      {
          email: 'demo',
          password: 'Abcd@123',
          password_confirmation: 'Abcd@123',
          accept_terms: '1'
      }
    end

    def with_less_password_length
      {
          email: 'demo@mailinator.com',
          password: 'Ab@1',
          password_confirmation: 'Ab@1',
          accept_terms: '1'
      }
    end

    def with_invalid_password
      {
          email: 'demo@mailinator.com',
          password: 'abcdefgh',
          password_confirmation: 'abcdefgh',
          accept_terms: '1'
      }
    end

    def with_mismatched_password
      {
          email: 'demo@mailinator.com',
          password: 'Abcd@123',
          password_confirmation: 'Ab@1',
          accept_terms: '1'
      }
    end

    def with_details_without_term
      {
          email: 'demo@mailinator.com',
          password: 'Abcd@123',
          password_confirmation: 'Abcd@123',
          accept_terms: ''
      }
    end

    def with_details_with_term
      {
          email: 'demo@mailinator.com',
          password: 'Abcd@123',
          password_confirmation: 'Abcd@123',
          accept_terms: '1'
      }
    end

  end
end
