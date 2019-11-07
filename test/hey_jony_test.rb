# frozen_string_literal: true

require_relative 'common'

class HeyJonyTest < Minitest::Test
  def test_jony_version
    assert_equal '0.1.0', HeyJony::VERSION
  end
end
