/*
 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26. 
 What is the sum of the digits of the number 2^1000?

 Usage: scalac Sixteen.scala; scala -classpath . Sixteen
*/

object Sixteen {
  def main(args: Array[String]) {
    val bigString = BigInt(2).pow(1000).toString
    var ret = 0
    for (c <- bigString) {
      ret += c.asDigit // toInt returns the ASCII value of this char. Lesson learned. :)
    }
    println(ret)
  }
}
