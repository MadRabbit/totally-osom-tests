#
# Minimalistic black and white reporter
#
class TOTES::Reporter::Hater < TOTES::Reporter

  def pass
    print "."
  end

  def skip
    print 'S'
  end

  def fail(e)
    print 'F'
    print "\n\n#{e}\n\n"
  end

  def error(e)
    print 'E'
    print "\n\n#{e}\n\n"
  end

  def summary
    puts "\n\n"

    if @fails_count == 0 && @errors_count == 0
      print "Okay. "
    else
      print "Meh..."
    end

    puts super
  end

  def waiting
    puts "Waiting...\n"
  end

end
