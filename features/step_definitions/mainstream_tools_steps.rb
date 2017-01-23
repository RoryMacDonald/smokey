Then /^I should see Publisher's publication index$/ do
  page.should have_selector("#publication-list-container")
end
