import Foundation

var str = readLine()!.split(separator: " ").map{ String($0)}

let a = str[0].map{String($0)}
let b = str[1].map{String($0)}

var start = 0
var result = Int.max


for i in 0...b.count-a.count{

    var start = i
    var res = 0
    for j in 0...a.count-1{
        if(a[j] != b[start]){
            res += 1
        }
        start += 1
    }
    result = min(result, res)
    
    
}

print(result)
