#
# Generic printer
#
class Printer

  def initialize
    @suites_count = 0
    @tests_count  = 0
    @pass_count   = 0
    @fail_count   = 0
    @error_count  = 0

    print "\n"
  end

  def pass
    raise "Should be implemented in a subclass"
  end

  def fail
    raise "Should be implemented in a subclass"
  end

  def error
    raise "Should be implemented in a subclass"
  end

  def summary
    raise "Should be implemented in a subclass"
  end

  def testing(suite)
    @suite = suite

    @suites_count += 1
  end

  def running(test)
    @tests_count += 1
  end

  def passed
    @pass_count += 1
    pass
  end

  def failed(e)
    @fail_count += 1
    fail
  end

  def errored(e)
    @error_count += 1
    error
  end

  def finish
    summary
  end

end
