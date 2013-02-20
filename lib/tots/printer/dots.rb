# encoding: utf-8

#
# Your good old dots printer
#
class Printer::Dots < Printer
  def pass
    print paint(".", GREEN)
  end

  def fail
    print paint('F', RED)
  end

  def error
    print paint('E', RED)
  end

  def summary
    puts "\n\n"

    if @fail_count == 0 && @error_count == 0
      print paint(" ✔ Osom! ", GREEN)
    else
      print paint(" ✖ Doh...", RED)
    end

    print paint("Tests: #{@tests_count} Passed: #{@pass_count} Failed: #{@fail_count} Errored: #{@error_count}\n", GREY)
  end
end
