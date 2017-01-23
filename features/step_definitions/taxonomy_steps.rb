Then /^I should be able to navigate the topic hierarchy$/ do
  random_page = page.all("nav.topics li a").sample
  visit_path random_page['href']

  random_second_level_page = page.all("nav.topics li a").sample
  visit_path random_second_level_page['href']
end

Then /^I should be able to navigate the browse pages$/ do
  random_page = page.all(".browse-panes ul li a").sample
  visit_path random_page['href']

  random_second_level_page = page.all(".pane-inner ul li a").sample
  visit_path random_second_level_page['href']
end

def random_path_selection(opts={})
  anchor_tags = opts[:anchor_tags] || []
  anchor_tags.map { |anchor| anchor.attributes["href"].value }.sample(1)
end
