#
# Just an auto-run hook
#
# Add this into your tests to be able to run them as plain ruby
#
# ```ruby
# require 'tots/autorun'
#
# describe Stuff do
# end
# ```
#

require_relative '../tots' unless defined?(TOTS)

TOTS::Runner.start
