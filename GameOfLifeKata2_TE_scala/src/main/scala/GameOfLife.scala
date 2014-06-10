// Created 2014-06-06 10:39:25 +0200

import org.scalatest.enablers.Length

object GameOfLife {
	def evolve(world: String): String = {
	  // world
	  // val cnt = world.count(x => x == '#')
	  val rows = world.split('\n')
	  
	  val height = rows.length
	  val width = rows(0).length
	  
	  def cellIsAlive(x:Int, y:Int): Boolean = {
	    if (x<0 || y<0 || x>=width || y>=height )
	      false
	    else
	    		rows(y)(x) == '#'
	  }
	  def calculateNeihgbours(x:Int, y:Int): Int = {
	    val neighbours = List((-1,0), (1,0), (0,-1), (0, 1), (-1, -1), (1, 1), (-1, 1), (1, -1))
	    neighbours.count{case (dx,dy) => cellIsAlive(x + dx, y+dy)} 
	  }
	  
	  val result = for(y<-0 until height) yield {
	    (for(x<-0 until width) yield {
	      if (calculateNeihgbours(x, y) == 2) 
	        rows(y)(x) 
	      else if (calculateNeihgbours(x, y) == 3) 
	        "#"
	      else
	        '.'
	    }).mkString
	  }
	  
	  result.mkString("\n")
	  
	  // world.map(c => if (c == '#') '.' else c )
	}
	
//	def evolve(world: String, generations: Int): String = {
//	  if (generations > 0) evolve(evolve(world), generations - 1) else world
//	}
	def evolve(world: String, generations: Int): String = generations match {
	  case 0 => world
	  case x => evolve(evolve(world), x - 1)
	}
	
}
