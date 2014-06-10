// Created 2014-06-05 20:47:23 +0200

object Balancer {
  def balance1(text: String): Boolean = {
    def next(text: List[Char], count: Int): Boolean = {
      if (text.isEmpty)
        count == 0
      else {
        val newCount = {
          if (text.head == '(') count + 1
          else if (text.head == ')') count - 1
          else count
        }
        if (newCount < 0)
          false
        else
          next(text.tail, newCount)
      }
    }
    next(text.toList, 0)
  }


  def balance2(text: String): Boolean = {
    def next(text: List[Char], count: Int): Boolean = text match {
      case Nil => count == 0
      case '(' :: tail => next(tail, count + 1)
      case ')' :: tail => if (count == 0) false else next(tail, count - 1)
      case _ :: tail => next(tail, count)
    }
    next(text.toList, 0)
  }


  def balance3(chars: String): Boolean = {
    def nextToken(chars: List[Char]): List[Char] = {
      if (chars.isEmpty || chars.head == '(' || chars.head == ')') chars
      else nextToken(chars.tail)
    }

    def processBlock(chars: List[Char], level: Int): Int = {
      val next = nextToken(chars)
      if (next.isEmpty) level
      else if (next.head == '(') processBlock(next.tail, level + 1)
      else if (level > 0) processBlock(next.tail, level - 1)
      else -1
    }

    processBlock(chars.toList, 0) == 0
  }
}
