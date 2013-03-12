#
# The main project's namespace
#
# Copyright (C) 2013 Nikolay Nemshilov
#
module TOTS
  VERSION = '0.0.0'
end

require_relative './tots/asserts'
require_relative './tots/matcher'
require_relative './tots/matcher/awesome'
require_relative './tots/reporter'
require_relative './tots/reporter/dots'
require_relative './tots/reporter/emoji'
require_relative './tots/reporter/hater'
require_relative './tots/watcher'
require_relative './tots/runner'
require_relative './tots/test'
require_relative './tots/spec'

