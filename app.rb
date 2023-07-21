# frozen_string_literal: true

require 'pry'
require_relative 'lib/router'
require_relative 'lib/gossip'
require_relative 'lib/view'
require_relative 'lib/controller'

router = Router.new
router.show_menu
