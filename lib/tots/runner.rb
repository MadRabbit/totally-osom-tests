#
# The runner
#
class TOTS::Runner

  def self.<<(spec)
    specs << spec
  end

  def self.specs
    @specs ||= []
  end

  def self.start
    specs.each(&:run)

    TOTS::Reporter.finish

    TOTS::Watcher.check
  end
end
