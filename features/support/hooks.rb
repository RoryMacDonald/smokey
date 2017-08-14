Before do
  page.driver.add_headers('User-Agent' => 'Smokey')
end

Before('@withanalytics') do
  page.driver.browser.url_blacklist = BLACKLISTED_URLS - [GOOGLE_ANALYTICS_URL]
end
