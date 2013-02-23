# encoding: utf-8

#
# Emoji printer
#
class TOTS::Printer::Emoji < TOTS::Printer
  GOOD = %w(🌵 🌴 🌲 🌳 🌿 🍀 🎄)
  WAIT = %w(🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘)

  def pass
    print GOOD[rand(GOOD.size)] + " "
  end

  def fail(e)
    print '😱 '
  end

  def error(e)
    print '💢 '
  end

  def summary
    puts "\n\n"

    if @fail_count == 0 && @error_count == 0
      print paint("😊  Osom! ", GREEN)
    else
      print paint("😱  Doh...", RED)
    end

    puts paint(super, GREY)
  end

  CYLON_SIZE = 10

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
