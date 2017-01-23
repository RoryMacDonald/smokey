Then /^the logo should link to the homepage$/ do
  logo = page.first('#logo')
  expect(logo['href']).to eql(ENV['EXPECTED_GOVUK_WEBSITE_ROOT'])
end
