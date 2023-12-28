// `dotnet fsi forty.fsx`

let mutable s = ""
let mutable i = 1

while s.Length < 1000000 do
    s <- s + string i
    i <- i + 1

let ret =
    (int s[0] - int '0')
    * (int s[9] - int '0')
    * (int s[99] - int '0')
    * (int s[999] - int '0')
    * (int s[9999] - int '0')
    * (int s[99999] - int '0')
    * (int s[999999] - int '0')

printfn "%d" ret
