// Created 2014-06-05 20:47:23 +0200

import org.scalatest.FunSuite
import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner

trait BalancerSuite extends FunSuite {
  
  def balance(text: String) : Boolean
  
  
  test("text with no parentheses is balanced") {
    assert(balance("fake") === true)
  }
  
  test("text with single parenthese is not balanced") {
    assert(balance("fa(ke") === false)
  }

  test("text with single matching parentheses is balanced") {
    assert(balance("fa()ke") === true)
  }
  
  test("text with multiple matching parentheses is balanced") {
    assert(balance("fa()k()e") === true)
  }
  
  test("text with nested multiple matching parentheses is balanced") {
    assert(balance("(fa()k((foo))()e)") === true)
  }

  test("text with nested multiple non-matching parentheses is not balanced") {
    assert(balance("(fa()k(((foo))()e)") === false)
  }
  
  test("text with multiple non-matching parentheses is not balanced") {
    assert(balance("())(") === false)
  }

  test("text with large amount of nested matching parentheses is balanced") {
    assert(balance("(" * 200000 + ")" * 200000) === true)
  }

  test("text with large amount of nested non-matching parentheses is not balanced") {
    assert(balance("(" * 200001 + ")" * 200000) === false)
  }

}

@RunWith(classOf[JUnitRunner])
class Balancer1Suite extends BalancerSuite {
  override def balance(text:String) : Boolean = {
    Balancer.balance1(text)
  }
}

@RunWith(classOf[JUnitRunner])
class Balancer2Suite extends BalancerSuite {
  override def balance(text:String) : Boolean = {
    Balancer.balance2(text)
  }
}

@RunWith(classOf[JUnitRunner])
class Balancer3Suite extends BalancerSuite {
  override def balance(text:String) : Boolean = {
    Balancer.balance3(text)
  }
}