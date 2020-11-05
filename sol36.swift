import Foundation

let n = Int(readLine()!)!
let str = readLine()?.split(separator: " ")
let str1 = readLine()?.split(separator: " ")

var dis = [Int](repeating: 0, count: n-1)
var gas = [Int](repeating: 0, count: n)

for i in 0...n-1{
    if(i != n-1){
        dis[i] = Int(String(str![i]))!
        gas[i] = Int(String(str1![i]))!
    }
    else{
        gas[i] = Int(String(str1![i]))!
    }
    
}

var point = 0
var next = 0
var res = 0

while next < n-1{
   
    if(gas[point] <= gas[next]){
        res = res + gas[point] * dis[next]
        next += 1
    }
    else{
        point = next
    }
}

print(res)
