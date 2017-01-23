Then /^I should see an input field for postcode$/ do
  page.body.should have_field('postcode')
end

Then /^I input "(.*)" as my postcode$/ do |postcode|
  fill_in 'postcode', with: postcode
  find('button[type=submit]').click
end
