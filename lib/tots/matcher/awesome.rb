#
# Awesome matchers handler
#
# ```ruby
# describe TOTS::Matcher::Awesome do
#   it "must provide awesome matchers" do
#     22.must == 22
#     22.must >  11
#     22.must =~ /2/
#   end
# end
# ```
#
class TOTS::Matcher
  def ==(value)
    assert @object == value, "#{@object.inspect} supposed to be equal #{value.inspect}"
  end

  def !=(value)
    assert @object != value, "#{@object.inspect} supposed not to be equal #{value.inspect}"
  end

  def =~(value)
    assert value =~ @object, "#{@object.inspect} doesn't match #{value.inspect}"
  end

  def >(value)
    assert @object > value, "#{@object.inspect} supposed to be > than #{value.inspect}"
  end

  def <(value)
    assert @object < value, "#{@object.inspect} supposed to be < than #{value.inspect}"
  end

  def >=(value)
    assert @object >= value, "#{@object.inspect} supposed to be >= than #{value.inspect}"
  end

  def <=(value)
    assert @object <= value, "#{@object.inspect} supposed to be <= than #{value.inspect}"
  end
end
