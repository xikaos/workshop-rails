Rails.application.config.generators do |g|
  g.assets = false
  g.helper = false
  g.skip_routes = true
  g.test_framework = nil
end