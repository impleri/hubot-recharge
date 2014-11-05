# Description:
#   Calculate Recharge Rate in Ingress.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot recharge max [level]
#   hubot recharge efficiency [level] [distance]
#
# Author:
#   impleri

convert = require "convert-units"

calculateEfficiency = (distance, level = 8) ->
    100 - (distance / (5 * level))

calculateDistance = (level = 8) ->
    250 * level

module.exports = (robot) ->
  robot.respond /recharge\s+max\s+([0-9]{1,2})/i, (msg) ->
    level = +msg.match[1]
    distance = calculateDistance level
    msg.reply "A level #{level} agent can recharge up to #{distance} km away."

  robot.respond /recharge\s+efficiency\s+([0-9]{1,2})\s+([0-9\.]+)\s*([a-z]+)/i, (msg) ->
    level = +msg.match[1]
    qty = +msg.match[2]
    unit = msg.match[3]
    distance = convert(qty).from(unit).to "km"
    rate = calculateEfficiency level, distance
    msg.reply "A level #{level} agent can recharge from #{distance} km away at #{rate}%."
