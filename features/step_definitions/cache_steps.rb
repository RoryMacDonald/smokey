When /^I check with SSL "(.*)" with Host: "(.*)"$/ do |hostname,http_host|
    page.driver.browser.agent.request_headers = {'Host' => http_host}
    check_url = "https://#{hostname}/"
    visit(check_url)
end
