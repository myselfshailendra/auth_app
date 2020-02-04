module Pages
  class Basic
    include Capybara::DSL

    def has_heading?(heading)
      has_css? 'h1', text: heading
    end
  end
end
