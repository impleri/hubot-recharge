chai = require "chai"
sinon = require "sinon"
chai.use require "sinon-chai"

expect = chai.expect

describe "recharge", ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require("../src/recharge-rate")(@robot)

  it "registers respond listeners", ->
    expect(@robot.respond).to.have.been.calledWith /recharge\s+max\s+([0-9]{1,2})/i
    expect(@robot.respond).to.have.been.calledWith /recharge\s+efficiency\s+([0-9]{1,2})\s+([0-9\.]+)\s*([a-z]+)/i
