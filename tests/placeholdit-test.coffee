# Hubot classes
Robot = require("hubot/src/robot")
TextMessage = require("hubot/src/message").TextMessage

chai = require 'chai'
mocha = require 'mocha'

{ expect } = chai

describe 'a hubot doing his thing', () ->
  user = null
  robot = null
  beforeEach (done) ->
    robot = new Robot null, 'mock-adapter', yes, 'TestHubot'
    robot.adapter.on 'connected', ->
      require("../index")(robot)
      # create a user
      user = robot.brain.userForId "1", {
        name: "mocha",
        room: "#mocha"
      }
      done()
    robot.run()

  afterEach (done) ->
    robot.server.close()
    robot.shutdown()
    done()

  it "responds when it hears placeholder 300 300", (done) ->
    robot.adapter.on "send", (envelope, strings) ->
      expect(strings[0]).to.be.a('string')
      done()
    robot.adapter.receive new TextMessage(user, "TestHubot placeholder 300 300")

  it "responds when it hears placeholder 300 300", (done) ->
    robot.adapter.on "send", (envelope, strings) ->
      expect(strings[0]).to.be.a('string')
      done()
    robot.adapter.receive new TextMessage(user, "TestHubot placeholder 300 300")