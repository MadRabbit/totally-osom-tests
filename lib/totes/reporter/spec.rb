#
# The spec style reporter
#
class TOTES::Reporter::Spec < TOTES::Reporter
  def testing(spec)
    super

    if (TOTES::Runner.tests[spec] || []).size > 0
      name = TOTES::Runner.stack(spec).join(' ')
      puts paint("\n#{name}\n", GREEN)
    end
  end

  def pass
    puts paint("  ✔ #{@test}", GREEN)
  end

  def skip
    puts paint("  - #{@test}", YELLOW)
  end

  def fail(e)
    puts paint("  ✖ #{@test}", RED)
    puts paint("\n\n#{e}\n\n", RED)
  end

  def error(e)
    puts paint("  ✖ #{@test}", RED)
    puts paint("\n\n#{e}\n\n", RED)
  end

  def summary
    puts "\n\n"

    if @fails_count == 0 && @errors_count == 0
      print paint("✔ Passed! ", GREEN)
    else
      print paint("✖ Failed ", RED)
    end

    puts paint(super, GREY)
  end

  def waiting
    puts "Waiting...\n"
  end
end
