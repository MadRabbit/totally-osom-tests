#
# The main project's namespace
#
# Copyright (C) 2013 Nikolay Nemshilov
#
module TOTS
  VERSION = '0.0.0'
end

require_relative './tots/fail'
require_relative './tots/spec'
require_relative './tots/assert'
require_relative './tots/matcher'
require_relative './tots/matcher/awesome'
require_relative './tots/runner'

TOTS::Runner.start
