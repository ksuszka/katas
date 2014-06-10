// Created 2014-06-04 23:31:23 +0200

import org.scalatest.FunSuite
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner

/**
 * This class is a test suite for the methods in object GameOfLife. To run
 * the test suite, you can either:
 *  - run the "test" command in the SBT console
 *  - right-click the file in eclipse and chose "Run As" - "JUnit Test"
 */
@RunWith(classOf[JUnitRunner])
class GameOfLifeSuite extends FunSuite {
  
  import GameOfLife._
  
  test("evolution of empty world do nothing") {
    val input = "....\n....\n...."
    val output = evolve(input)
    assert(output === input)
  }

  test("single cell dies") {
    val input = "....\n.*..\n...."
    val output = evolve(input)
    assert(output === "....\n....\n....")
  }

  test("cell with two neighbours survives") {
    val input = "...*\n..*.\n.*.."
    val output = evolve(input)
    assert(output === "....\n..*.\n....")
  }
  
  test("cell with three neighbours survives") {
    val input = "**\n**"
    val output = evolve(input)
    assert(output === "**\n**")
  }

  test("cell with four neighbours dies") {
    val input = "***\n.*.\n.*."
    val output = evolve(input)
    assert(output === "***\n...\n...")
  }

  test("empty cell with three neighbours is born") {
    val input = "*..\n..*\n*.."
    val output = evolve(input)
    assert(output === "...\n.*.\n...")
  }
  
  test("V set is stabilized after 6 turns") {
    val input = "*...*\n.*.*.\n..*..\n....."
    val output = evolve(input, 6)
    assert(output === "..*..\n.*.*.\n.*.*.\n..*..")
  }
  
  test("V set is still stabile after 10000 turns") {
    val input = "*...*\n.*.*.\n..*..\n....."
    val output = evolve(input, 10000)
    assert(output === "..*..\n.*.*.\n.*.*.\n..*..")
  }

}
