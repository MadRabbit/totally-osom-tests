#
# Generic printer
#
class Printer
  RED     = '1'
  GREEN   = '2'
  YELLOW  = '3'
  VIOLET  = '4'
  MARGETA = '5'
  BLUE    = '6'
  GREY    = '7;2'

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

  def paint(string, color)
    "\e[3#{color}m#{string}\e[0m"
  end

  def highlight(string, color)
    "\e[4#{color}m#{string}\e[0m"
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
    fail(e)
  end

  def errored(e)
    @error_count += 1
    error(e)
  end

  def finish
    summary
  end

end
