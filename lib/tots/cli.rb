#
# A simple CLI for the `tots` cmd
#
require_relative '../tots' unless defined?(TOTS)

args = []
dirs = []

dirt = ARGV.dup

dirt.each do |arg|
  case arg
  when '-h'
  else
    # assuming it's a dir
    dirs << arg
  end
end

dirs << 'test' if dirs.empty?

dirs.map! do |name|
  name = name.slice(0, name.size - 1) if name[name.size-1] == '/'
  File.exists?(name) && File.directory?(name) ? "#{name}/**/*_test.rb" : name
end

$LOAD_PATH << "#{Dir.pwd}/test/" if File.exists?('test') && File.directory?('test')

require "test_helper" if File.exists?("test/test_helper.rb")

Dir[*dirs].each do |name|
  require "#{Dir.pwd}/#{name}"
end
