chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"
should = chai.should()

describe "recharge", ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require("../src/recharge-rate")(@robot)

  it "registers listeners", ->
    @robot.respond.should.be.calledWith /recharge\s+(max|distance)\s+([0-9]{1,2})/i
    @robot.respond.should.be.calledWith /recharge\s+(efficiency|rate|percent)\s+([0-9]{1,2})\s+([0-9\.]+)\s*([a-z]+)?/i
