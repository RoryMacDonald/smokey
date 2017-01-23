Then /^I should see an input field for postcode$/ do
  page.body.should have_field('postcode')
end
