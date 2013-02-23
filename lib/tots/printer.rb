# encoding: utf-8

#
# Generic printer
#
class TOTS::Printer
  RED     = '1'
  GREEN   = '2'
  YELLOW  = '3'
  VIOLET  = '4'
  MARGETA = '5'
  BLUE    = '6'
  GREY    = '7;2'

  def self.set(name)
    @klass = const_get(name[0].upcase + name.slice(1, name.size - 1))
  end

  def self.method_missing(*args)
    @inst ||= (@klass || Dots).new

    @inst.__send__(*args)
  end

  def initialize
    @suites_count  = 0
    @tests_count   = 0
    @asserts_count = 0
    @passed_count  = 0
    @fails_count   = 0
    @errors_count  = 0
    @skipped_count = 0

    print "\n"
  end

  def pass
    raise "Should be implemented in a subclass"
  end

  def skip
    raise "Should be implemented in a subclass"
  end

  def fail
    raise "Should be implemented in a subclass"
  end

  def error
    raise "Should be implemented in a subclass"
  end

  def summary
    {
      :Asserts => @asserts_count,
      :Tests   => @tests_count,
      :Passed  => @passed_count,
      :Failed  => @fails_count,
      :Errored => @errors_count,
      :Skipped => @skipped_count

    }.map do |key, value|
      "#{value} #{key}"
    end.join(', ')
  end

  def waiting
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

  def asserting(msg)
    @asserts_count += 1
  end

  def passed
    @passed_count += 1
    pass
  end

  def failed(e)
    @fails_count += 1
    fail(e)
  end

  def errored(e)
    @errors_count += 1
    error(e)
  end

  def skipped
    @skipped_count += 1
    skip
  end

  def finish
    summary
  end

  def watching(on)
    if on
      puts "\n"
      @waiting = Thread.new { waiting }
    else
      @waiting.kill if @waiting
      puts "\n"
    end
  end
end
