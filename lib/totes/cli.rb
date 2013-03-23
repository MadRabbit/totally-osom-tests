#
# A simple CLI for the `TOTES` cmd
#

args = {}
dirs = []

dirt = ARGV.dup

def cut_and_print(string)
  print string.gsub(string[/\A(\n +)/], "\n").strip + "\n\n"
  exit
end

while arg = dirt.shift
  case arg
  when '-h', '--help'
    cut_and_print %Q{
      TOTES Runner Help:

        TOTES path[ path ...] [OPTSIONS]

      OPTIONS:

        -h      --help              # show this help
        -w      --watch             # watch for changes in specified files/dires
        -r name --reporter name     # specify the reporter
        -rs     --reporters         # list known reporters
    }

  when '-rs', '--reporters'
    cut_and_print %Q{
      TOTES Known Reporters:

        dots  - the standard dots reporter
        spec  - BDD spec reporter
        hater - the old style black and white reporter
        emoji - just for kicks
    }

  when '-w', '--watch'
    args['-w'] = true

  when '-r', '--reporter'
    args['-r'] = dirt.shift

  else
    # assuming it's a dir
    dirs << arg
  end
end

require_relative '../totes/autorun'

# setting the reporter
TOTES::Reporter.set args['-r'] if args['-r']

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
TOTES::Watcher.watch(dirs) if args.include?('-w')
