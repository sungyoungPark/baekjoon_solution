import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(str![0])!
let L = Int(str![1])!

let str1 = readLine()?.split(separator: " ")

var arr = [Int](repeating: 0, count: n)

for i in 1...n{
    arr[i-1] = Int(String(str1![i-1]))!
}

arr = arr.sorted()

var fin = 0.0
var count = 0

for i in 0...n-1{
    if(fin < Double(arr[i])){
        fin = Double(arr[i]) - 0.5 + Double(L)
        count += 1
    }
    
    
    
}

print(count)


