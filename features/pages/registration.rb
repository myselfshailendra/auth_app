module Pages
  class Registration < Basic

    def visit_page
      page_url = '/sign_up'
      visit page_url
      self
    end
  end
end
