import Foundation

let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: n)
for i in 0...n-1{
    let a = Int(readLine()!)!
    arr[i] = a
}

arr = arr.sorted(by: >)
var res = 0
var index = 1
for i in arr{
    let ad = i - (index-1)
    if(ad > 0){
        res = res + ad
    }
    index+=1
}
print(res)

