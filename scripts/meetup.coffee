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

module.exports = (robot) ->

  robot.respond /.* next (.*) meetup.*/i, (msg) ->
    groupType = msg.match[1]
    if groupType is "sdphp"
      url = "https://flickering-heat-5459.firebaseio.com/meetups/SanDiegoPHP.json"
    else if groupType is "sdlug"
      url = "https://flickering-heat-5459.firebaseio.com/meetups/San-Diego-Laravel-Meetup.json"
    else
      msg.reply "Not sure for that group"
    msg.http(url)
    .header('User-Agent', 'Hubot')
    .get() (err, _, body) ->
      return msg.send "Sorry, something broke." if err
      data = JSON.parse(body.toString("utf-8"))
      msg.send data.summary
