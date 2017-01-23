Then /^I should be able to navigate the topic hierarchy$/ do
  topics = Nokogiri::HTML.parse(page.body).css("nav.topics li a")
  random_path_selection(anchor_tags: topics).each do |path|
    visit_path path

    subtopics = Nokogiri::HTML.parse(page.body).css("nav.topics li a")
    random_path_selection(anchor_tags: subtopics).each do |path|
      visit_path path
    end
  end
end

Then /^I should be able to navigate the browse pages$/ do
  categories = Nokogiri::HTML.parse(page.body).css(".browse-panes ul li a")
  random_path_selection(anchor_tags: categories).each do |path|
    visit_path path

    subcategories = Nokogiri::HTML.parse(page.body).css(".pane-inner ul li a")
    random_path_selection(anchor_tags: subcategories).each do |path|
      visit_path path
    end
  end
end

def random_path_selection(opts={})
  size = opts[:size] || 3
  anchor_tags = opts[:anchor_tags] || []
  anchor_tags.map { |anchor| anchor.attributes["href"].value }.sample(size)
end
