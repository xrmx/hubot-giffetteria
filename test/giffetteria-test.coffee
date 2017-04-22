Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/giffetteria.coffee')

describe 'giffetteria', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'responds to giffetteria', (done) ->
    @room.user.say('alice', '@hubot giffetteria ciao')
      .then =>
        console.log(@room.messages)
        expect(@room.messages[1][1]).to.eventually.contain 'http://giffetteria.it'
        done()
      .catch (err) ->
        console.log(err)
