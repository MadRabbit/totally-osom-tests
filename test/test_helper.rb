require_relative '../lib/totes/autorun'

class TOTES::Spec

  def assert_fails(&block)
    assert_raises TOTES::Test::Fail do
      block.yield
    end
  end

end
