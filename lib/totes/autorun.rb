#
# Just an auto-run hook
#
# Add this into your tests to be able to run them as plain ruby
#
# ```ruby
# require 'totes/autorun'
#
# describe Stuff do
# end
# ```
#

require_relative '../totes' unless defined?(TOTES)

at_exit { TOTES::Runner.start }
