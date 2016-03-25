require 'test_helper'

class SampleTest < Minitest::Test
	def test_application_name
		assert_equal "Taskv::Application", Rails.application.class.name
	end

	def test_debug_assets
		assert_equal false, Rails.application.config.assets.debug
	end
	
end