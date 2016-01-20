require "lazychess/version"
Dir["./lib/lazychess/*.rb"].each {|file| require file }
Dir["./lib/concepts/*.rb"].each {|file| require file }
Dir["./lib/services/*.rb"].each {|file| require file }

module Lazychess
  # Your code goes here...
end
