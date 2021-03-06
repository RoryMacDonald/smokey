When /^I search for "(.*)"$/ do |term|
  visit_path "/search?q=#{term}"
end

Then /^I should see some search results$/ do
  result_links = page.all(".results-list li a")
  result_links.count.should >= 1
end

Then /^I should see organisations in the organisation filter$/ do
  organisation_options = page.all("#organisations-filter input")
  organisation_options.count.should >= 10
end

And /^the search results should have different titles$/ do
  result_titles = page.all(".results-list li a").map(&:text)

  expect(result_titles.uniq.count).to eq(result_titles.count)
end
