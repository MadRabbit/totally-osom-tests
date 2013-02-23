require_relative '../lib/tots/autorun'

class TOTS::Spec

  def assert_fails(&block)
    assert_raises TOTS::Test::Fail do
      block.yield
    end
  end

end
