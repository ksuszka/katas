// Created 2014-06-04 23:31:23 +0200

object GameOfLife {
  def evolve(data: String) = {
    val world = data split "\n"
    val height = world count(x => true)
    val width = world.head.length
    
    def printCell(b: Boolean) = b match {
      case true => "*"
      case false => "."
    }
    
    def cell(x: Int, y: Int) = {
      if (x < 0 || y < 0 || x >= width || y >= height) {
        false
      } else {
        world(y)(x) != '.'
      }
    }
    
    def countNeighbours(x: Int, y: Int) = {
      // val directions = List((-1,0), (1,0), (0,-1), (0,1), (-1,-1), (-1,1), (1,-1), (1,1))
      // directions.count { case (dx,dy) => cell(x + dx, y + dy) }
      (for (dx <- -1 until 2;
        dy <- -1 until 2;
        if !(dx == 0 && dy == 0)) yield cell(x + dx, y + dy)).count(identity)
    }
    
    def newCell(x: Int, y: Int) = {
      val nc = countNeighbours(x,y)
      val alive = cell(x,y)
      alive && (nc == 2 || nc == 3) || (!alive && nc == 3)
    }
    
    (for (y <- 0 until height) yield {
      (for (x <- 0 until width) yield printCell(newCell(x, y))).mkString
      }).mkString("\n")
    // List.range(0, height).map (y => 
    //   List.range(0, width).map (x => printCell(newCell(x, y))).mkString
    //   ).mkString("\n")
  }
  
  def evolve(data:String, generations: Int): String = {
    // tail recursion
    if (generations == 0) data
    else {
      val next = evolve(data)
      evolve(next, generations - 1)
    }
  }
}
