// Created 2014-06-06 10:39:25 +0200

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
  
  test("empty world stays empty") {
    val world = "....\n....\n...."
    val result = evolve(world) 
    assert(result === world)
  }

  test("on single life kill it") {
    val world = "...\n.#.\n..."
    val result = evolve(world)
    assert(result === "...\n...\n...")
  }
  
  test("on double life kill it") {
    val world = "###"
    val result = evolve(world)
    assert(result === ".#.")
  }
  
  test("on double life in ver dimension kill it") {
    val world = "#\n#\n#"
    val result = evolve(world)
    assert(result === ".\n#\n.")
  }
  
  test("on double life in diag dimension kill it") {
    val world = "..#\n.#.\n#.."
    val result = evolve(world)
    assert(result === "...\n.#.\n...")
  }
  
  test("on double life in diag2 dimension kill it") {
    val world = "#..\n.#.\n..#"
    val result = evolve(world)
    assert(result === "...\n.#.\n...")
  }
    
  test("when three neibours new one is born") {
    val world = "##.\n#..\n..."
    val result = evolve(world)
    assert(result === "##.\n##.\n...")
  }
  
  
  test("V set is stabilized after 6 turns") {
    val input = "#...#\n.#.#.\n..#..\n....."
    val output = evolve(input, 6)
    assert(output === "..#..\n.#.#.\n.#.#.\n..#..")
  }

  test("V set is still stabile after 10000 turns") {
    val input = "#...#\n.#.#.\n..#..\n....."
    val output = evolve(input, 10000)
    assert(output === "..#..\n.#.#.\n.#.#.\n..#..")
  }
  
}
