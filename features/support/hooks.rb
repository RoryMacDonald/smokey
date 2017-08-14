Before do
  page.driver.add_headers('User-Agent' => 'Smokey')
end

Before('@withanalytics') do
  page.driver.browser.url_blacklist = BLACKLISTED_URLS - [GOOGLE_ANALYTICS_URL]
end

After do |scenario|
  ENV['EMAIL_RECIPIENTS'] = 'alec.gibson@digital.cabinet-office.gov.uk'
  Cucumber.wants_to_quit = true if scenario.failed? # TODO: Remove this line
end
