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

    print paint("#{@tests_count} Tests, #{@pass_count} Passed, #{@fail_count} Failed, #{@error_count} Errored\n", GREY)
  end
end
