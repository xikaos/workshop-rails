Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
  g.assets = false
  g.helper = false
  g.skip_routes = true
  g.test_framework = nil
end


