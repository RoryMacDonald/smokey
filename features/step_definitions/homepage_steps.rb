Then /^the logo should link to the homepage$/ do
  logo = Nokogiri::HTML.parse(page.body).at_css('#logo')
  logo.attributes['href'].value.should == ENV['EXPECTED_GOVUK_WEBSITE_ROOT']
end
