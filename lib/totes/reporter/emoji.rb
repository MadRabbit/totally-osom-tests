# encoding: utf-8

#
# Emoji reporter
#
class TOTES::Reporter::Emoji < TOTES::Reporter
  GOOD = %w(🌵 🌴 🌲 🌳 🌿 🍀 🎄)
  WAIT = %w(🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘)

  def pass
    print GOOD[rand(GOOD.size)] + " "
  end

  def skip
    print '😴 '
  end

  def fail(e)
    print '😡 '
  end

  def error(e)
    print '💥 '
  end

  def summary
    puts "\n\n"

    if @fails_count == 0 && @errors_count == 0
      print paint("😊  Happy! ", GREEN)
    else
      print paint("😱  Oh, no... ", RED)
    end

    puts paint(super, GREY)
  end

  def waiting
    puts "\n\n"

    i = 0

    while true
      i = 0 if i > (WAIT.size - 1)

      puts "\u001b[2A\r" + paint('Waiting ', GREY) + WAIT[i] + "\n\n"

      sleep 0.08

      i += 1
    end
  end
end
