#
# File changes watcher
#
class TOTS::Watcher

  def self.watch(paths)
    @paths = paths
  end

  def self.check
    return if ! @paths

    TOTS::Printer.watching(true)

    setup; @watching = true if !@watching
  end

  def self.setup
    require 'rb-fsevent'

    fsevent = FSEvent.new
    fsevent.watch Dir.pwd do |directories|
      TOTS::Printer.watching(false)

      puts "Detected change inside: #{directories.inspect}\n"

      TOTS::Runner.start
    end

    fsevent.run
  end

end
