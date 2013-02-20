#
# Your good old dots printer
#
class Printer::Dots < Printer
  def pass
    print "."
  end

  def fail
    print 'F'
  end

  def error
    print 'F'
  end

  def summary
    puts "\n\nTests: #{@tests_count} Passed: #{@pass_count} Failed: #{@fail_count} Errored: #{@error_count}"
  end
end
