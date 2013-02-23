# encoding: utf-8

#
# Your good old dots printer
#
class TOTS::Printer::Dots < TOTS::Printer
  def pass
    print paint(".", GREEN)
  end

  def fail(e)
    print paint('F', RED)
  end

  def error(e)
    print paint('E', RED)
  end

  def summary
    puts "\n\n"

    if @fails_count == 0 && @errors_count == 0
      print paint("✔ Osom! ", GREEN)
    else
      print paint("✖ Doh... ", RED)
    end

    puts paint(super, GREY)
  end

  CYLON_SIZE = 10

  def waiting
    puts "\n\n"

    i = 0

    while true
      inc =  1 if i == 0
      inc = -1 if i > (CYLON_SIZE - 3)

      dots = Array.new(CYLON_SIZE).map{ |i| ' ' }

      dots[i]           = paint("■", RED)
      dots[i - inc]     = paint("■", RED + ";2") if i > 0
      dots[i - 2 * inc] = paint("∙", RED + ";2") if i < CYLON_SIZE - 2 && i > 1

      puts "\u001b[2A\r" + paint('Watching ', GREY) + dots.join('') + "\n\n"

      sleep 0.07

      i += inc
    end
  end
end


