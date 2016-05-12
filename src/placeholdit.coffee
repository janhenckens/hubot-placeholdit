# Description:
#   Returns a url to the placehold.it image of the size you entered
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   placeholder width height
#
# Author:
#   janhenckens

module.exports = (robot) ->
  robot.respond /placeholder (.*) (.*)/i, (msg)->
    width = msg.match[1]
    height = msg.match[2]
    msg.send "http://placehold.it/#{width}x#{height}"

  robot.respond /placeholder (.*) (.*) (.*)/i, (msg)->
    width = msg.match[1]
    height = msg.match[2]
    colour = msg.match[3]
    msg.send "http://placehold.it/#{width}x#{height}/#{colour}"
