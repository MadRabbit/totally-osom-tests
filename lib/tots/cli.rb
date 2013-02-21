#
# A simple CLI for the `tots` cmd
#
require_relative '../tots/autorun'

args = []
dirs = []

dirt = ARGV.dup

dirt.each do |arg|
  case arg
  when '-h', '--help'
    puts <<-EOF.gsub(/(\A|\n)\s+\|/, "\\1")
    |TOTS Runner Help:
    |
    |  tots path[ path ...] [OPTSIONS]
    |
    |
    |OPTIONS:
    |
    |  -h  --help      # show this help
    |  -w  --watch     # watch for changes in specified files/dires
    |
    EOF
    exit

  when '-w', '--watch'
    args << '-w'

  else
    # assuming it's a dir
    dirs << arg
  end
end

# figuring the paths
dirs << 'test' if dirs.empty?

dirs.map! do |name|
  name = name.slice(0, name.size - 1) if name[name.size-1] == '/'
  File.exists?(name) && File.directory?(name) ? "#{name}/**/*_test.rb" : name
end

# including the test files
$LOAD_PATH << "#{Dir.pwd}/test/" if File.exists?('test') && File.directory?('test')

require "test_helper" if File.exists?("test/test_helper.rb")

Dir[*dirs].each do |name|
  require "#{Dir.pwd}/#{name}"
end

# watching for the changes
TOTS::Watcher.watch(dirs) if args.include?('-w')
