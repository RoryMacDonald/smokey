Then /^I should be able to search the tariff and see matching results$/ do
  %w(animal mineral vegetable).each do |query|
    visit_path "/trade-tariff/sections"

    fill_in("search_t", with: query)
    click_button("Search")

    expected_search_results_text = %r(Search results for (?:‘|')#{query}(?:’|'))
    expect(page.body).to have_content(expected_search_results_text)
  end
end
