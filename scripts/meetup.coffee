# Description:
#   Hubot get Meetup information for SDPHP and SDLuG
#
# Dependencies:
#   url
#
# Configuration:
#   None
#
# Commands:
#   hubot when is the next sdphp meetup
#
# Author:
#   ericvanjohnson


request = require 'request'

resp = ""

module.exports = (robot) ->

  robot.respond /next (.*) meetup/i, (msg) ->
    groupType = msg.match[1]
    if groupType is "sdphp"
      request.get {'https://flickering-heat-5459.firebaseio.com/meetups/SanDiegoPHP/summary.json', json : true}, (err, r, body) ->
        resp = JSON.parse(body)
        msg.reply resp
#      msg.http('https://flickering-heat-5459.firebaseio.com/meetups/SanDiegoPHP/summary.json')
#        .get() (err, res, body) ->


      #msg.reply "The next SDPHP MeetUp is"
      #msg.http('https://flickering-heat-5459.firebaseio.com/meetups/SanDiegoPHP/summary.json')
        #.get() (err, res, body) ->
        #msg.reply = JSON.parse(body)
    else if groupType is "sdlug"
      msg.reply "The next SDLUG MeetUp is"
    else
      msg.reply "Not sure for that group"
