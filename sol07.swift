import Foundation

let str = readLine()!.split(separator: " ")

let n = Int(str[0])!
let w = Int(str[1])!
let L = Int(str[2])!

var weight = 0
var arr = [Int](repeating: 0, count: n)
var time = 0
var queee = [Int](repeating: 0, count: w)
let car = readLine()?.split(separator: " ")

for i in 1...n{
    arr[i-1] = Int(String(car![i-1]))!
   
    while true {
        weight = weight - queee.first!
        queee.remove(at: 0)
        if(weight + arr[i-1] <= L){
            queee.append(arr[i-1])
            weight = weight + arr[i-1]
            time += 1
            break
        }
        else{
        time += 1
        queee.append(0)
        }
    }
    
}

print(time+w)

