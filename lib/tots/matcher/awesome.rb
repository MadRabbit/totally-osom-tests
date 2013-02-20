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
    if @object != value
      raise TOTS::Fail, "#{@object.inspect} supposed to be equal #{value.inspect}"
    end
  end

  def !=(value)
    if @object == value
      raise TOTS::Fail, "#{@object.inspect} supposed not to be equal #{value.inspect}"
    end
  end

  def =~(value)
    unless value =~ @object
      raise TOTS::Fail, "#{@object.inspect} doesn't match #{value.inspect}"
    end
  end

end
