import Foundation

let n = Int(readLine()!)!

var min = Int.max
var arr = [[Int]]()

for i in 1...n{
    let str = readLine()?.split(separator: " ")
    arr.append( [Int(String(str![0]))!,Int(String(str![1]))!])
}

arr.sort { (a1, a2) -> Bool in
    if(a1[1] > a2[1]){
        return true
    }
    else{
        return false
    }
}

for a in arr{
    if a[1] < min{
        min = a[1]
    }
    min = min-a[0]
    
}
if(min < 0){
    print(-1)
}
else{
    print(min)
}
