#
# The standard assertions
#
module TOTES::Asserts
  def assert(smth, msg="No message given")
    TOTES::Reporter.asserting(msg)

    unless smth
      raise TOTES::Test::Fail, msg
    end
  end

  def assert_equal(v1, v2, msg=nil)
    assert v1 == v2, msg || "#{v1.inspect} supposed to be equal to #{v2.inspect}"
  end

  def assert_empty(v, msg=nil)
    assert_respond_to v, :empty?
    assert v.empty?, msg || "#{v.inspect} supposed to be empty"
  end

  def assert_respond_to(obj, method, msg=nil)
    assert obj.respond_to?(method), msg || "#{obj.inspect} supposed to respond to the #{method} method"
  end

  def assert_nil(v, msg=nil)
    assert v === nil, msg || "#{v.inspect} supposed to be nil"
  end

  def assert_includes(list, value, msg=nil)
    assert_respond_to list, :include?
    assert list.include?(value), msg || "#{list.inspect} supposed to include #{value.inspect}"
  end

  def assert_match(obj, re, msg=nil)
    assert_respond_to re, :=~
    assert re =~ obj, msg || "#{obj.inspect} supposed to match #{re.inspect}"
  end

  def assert_instance_of(obj, klass, msg=nil)
    assert obj.instance_of?(klass), msg || "#{obj.inspect} supposed to be instance of #{klass}"
  end

  def assert_raises(type, msg=nil, &block)
    raise ArgumentError, "no block given" if !block_given?

    begin
      yield

      assert false, msg || "expected to raise #{type}, but nothing was raised"

    rescue Exception => e
      if type && !(e.is_a?(type))
        assert false, msg || "expected to raise #{type}, but got #{e.class} instead"
      end
    end
  end
end
