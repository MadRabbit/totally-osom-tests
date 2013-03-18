#
# The main project's namespace
#
# Copyright (C) 2013 Nikolay Nemshilov
#
module TOTES
  VERSION = '0.0.0'
end

require_relative './totes/asserts'
require_relative './totes/matcher'
require_relative './totes/matcher/awesome'
require_relative './totes/reporter'
require_relative './totes/reporter/dots'
require_relative './totes/reporter/emoji'
require_relative './totes/reporter/hater'
require_relative './totes/watcher'
require_relative './totes/runner'
require_relative './totes/stats'
require_relative './totes/test'
require_relative './totes/spec'

