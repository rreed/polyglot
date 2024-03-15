// hrm, no sets in Wren, I guess we're using a list
// this...isn't a very interesting algorithm :)
// but hey, this language seems alright!
var seen = []
for (a in 2..100) {
  for (b in 2..100) {
    var val = a.pow(b)
    if (!seen.contains(val)) {
      seen.add(val)
    }
  }
}

System.print(seen.count)
