#
# File changes watcher
#
class TOTES::Watcher

  def self.watch(paths)
    @paths = paths
  end

  def self.check
    return if ! @paths

    TOTES::Reporter.watching(true)

    setup; @watching = true if !@watching
  end

  def self.setup
    require 'rb-fsevent'

    fsevent = FSEvent.new
    fsevent.watch Dir.pwd do |directories|
      TOTES::Reporter.watching(false)

      puts "Detected change inside: #{directories.inspect}\n"

      TOTES::Runner.start
    end

    fsevent.run
  end

end
