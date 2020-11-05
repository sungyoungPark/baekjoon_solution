import Foundation

let color = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"]
var res = 0

for _ in 1...2{
    res = res*10
    let str = readLine()!
    res = res +  color.firstIndex(of: String(str))!
}

let a = readLine()
let b = pow(10, color.firstIndex(of: String(a!))!)

res = res * Int(b.description)!

print(res)
