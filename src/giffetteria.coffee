# Description
#   A hubot script to query giffeteria.it
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot giffetteria - <what the respond trigger does>
#
# Author:
#   Riccardo Magliocchetti <riccardo.magliocchetti@gmail.com>

$ = require("cheerio")

module.exports = (robot) ->
  robot.hear /giffetteria (.*)/i, (res) ->
    query = res.match[1]
    robot.http("http://giffetteria.it/?s=" + encodeURIComponent(query))
      .get() (err, r, body) ->
        if err
          return res.send "Epic fail!"
        gifs = $('.gf-gif-link img', body)
        if not gifs.length
          return res.send "No gif found!"
        gif = res.random gifs
        src = $(gif).attr('data-gif')
        res.send src
