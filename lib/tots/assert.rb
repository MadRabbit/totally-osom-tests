#
# The standard assertions
#
class TOTS::Spec
  def assert(smth, msg="No message given")
    unless smth
      raise TOTS::Fail, msg
    end
  end

  def assert_equal(v1, v2, msg=nil)
    unless v1 == v2
      raise TOTS::Fail, "#{v1.inspect} supposed to be equal to #{v2.inspect}"
    end
  end

  def assert_raises(type, &block)
    raise ArgumentError, "no block given" if !block_given?

    begin
      yield

      raise TOTS::Fail, "expected to raise #{type}, but nothing was raised"

    rescue Exception => e
      if type && !(e.is_a?(type))
        raise TOTS::Fail, "expected to raise #{type}, but got #{e.class} instead"
      end
    end
  end
end
