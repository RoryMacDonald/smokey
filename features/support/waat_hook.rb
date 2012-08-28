Before ('@waat') do
  puts "waat before hook"
  initialize_waat()
  enable_web_analytics_testing
end

After ('@waat') do
  disable_web_analytics_testing
  puts "waat after hook"
end