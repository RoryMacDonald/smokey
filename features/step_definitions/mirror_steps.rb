Given /^I am testing the mirror in "(.*)"$/ do |provider|
      @host = "https://www-origin.mirror.#{provider}.production.govuk.service.gov.uk"
end
