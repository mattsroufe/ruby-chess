require "lazychess/version"
Dir["./lib/lazychess/*.rb"].each {|file| require file }
Dir["./lib/concepts/*.rb"].each {|file| require file }
# require_relative "concepts/castle"
# require_relative "concepts/bishop"
# require_relative "concepts/piece"
# require_relative "lazychess/board"
# require_relative "lazychess/game"

module Lazychess
  # Your code goes here...
end
