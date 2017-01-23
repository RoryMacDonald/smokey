Given /^I am testing "(.*)"/ do |host|
  if host.include? "://"
    @host = host
  else
    @host = application_base_url(host)
  end
end

Given /^I am an authenticated API client$/ do
  @authenticated_as_client = true
end

When /^I go to the "([^"]*)" landing page$/ do |app_name|
  visit_path application_base_url(app_name)
end

When /^I (try to )?request "(.*)"$/ do |attempt_only, path_or_url|
  url = if path_or_url.start_with?("http")
    path_or_url
  else
    "#{@host}#{path_or_url}"
  end
  request_method = attempt_only ? :try_get_request : :get_request
  @response = send(request_method, url, default_request_options)
end

When /^I visit "(.*)"$/ do |path_or_url|
  visit_path path_or_url
end

When /^I visit "(.*)" without authentication$/ do |path_or_url|
  visit_without_auth path_or_url
end

When /^I try to visit "(.*)"$/ do |path_or_url|
  visit_path path_or_url
end

When /^I visit "(.*)" without following redirects$/ do |path|
  @response = single_http_request("#{@host}#{path}")
end

When /^I visit "([^"]*)" on the "([^"]*)" application$/ do |path, application|
  application_host = application_base_url(application)
  @response = get_request("#{application_host}#{path}", default_request_options)
end

When /^I visit "(.*)" (\d+) times$/ do |path, count|
  count.to_i.times {
    @response = get_request("#{@host}#{path}", default_request_options)
  }
end

When /^I visit a non-existent page$/ do
  @response = get_request("#{@host}/404", default_request_options.merge(return_response_on_error: true))
end

Then /^I should be able to visit:$/ do |table|
  table.hashes.each do |row|
    visit_path row['Path']
  end
end

Then /^I should be redirected when I try to visit:$/ do |table|
  table.hashes.each do |row|
    visit_path row['Path']
    page.current_path.should_not == row['Path']
  end
end

Then /^I should get a (\d+) status code$/ do |status|
  if @response
    expect(@response.code.to_i).to eq status.to_i
  else
    expect(page.status_code.to_i).to eq status.to_i
  end
end

Then /^I should get a "(.*)" header of "(.*)"$/ do |header_name, header_value|
  header_as_symbol = header_name.gsub('-', '_').downcase.to_sym

  if @response.respond_to? :headers
    @response.headers[header_as_symbol].should == header_value
  elsif @response[header_name]
    @response[header_name].should == header_value
  else
    raise "Couldn't find header '#{header_name}' in response"
  end
end

Then /I should get a content length of "(\d+)"/ do |length|
  @response.net_http_res['content-length'].should == length
end

Then /^I should see "(.*)"$/ do |content|
  if @responses
    @responses.each do |response|
      expect(response.body).to include(content)
    end
  elsif @response
    expect(@response.body).to include(content)
  elsif page
    expect(page.body).to include(content)
  end
end

Then /^I should be at a location path of "(.*)"$/ do |location_path|
  @response['location'].should == "#{@host}#{location_path}"
end

When /^I click "(.*?)"$/ do |link_text|
  link_href = Nokogiri::HTML.parse(@response.body).at_xpath("//a[text()='#{link_text}']/@href")
  link_href.should_not == nil
  step "I visit \"#{link_href.value}\""
end

When /^I try to post to "(.*)" with "(.*)"$/ do |path, payload|
  @response = post_request "#{@host}#{path}", :payload => "#{payload}"
end
