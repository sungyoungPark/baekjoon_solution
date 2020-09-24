import Foundation

let n = Int(readLine()!)!

var arr = [[Int]](repeating: [], count: n)

for i in 1...n{
    let str = readLine()?.split(separator: " ")
    let a = Int(String(str![0]))!
    let b = Int(String(str![1]))!
    arr[i-1] = [a,b]
    
}

arr = arr.sorted(by: { (a1, b1) -> Bool in
    if(a1[0]>b1[0]){
        return false
    }
    else if (a1[0]==b1[0]){
        if(a1[1] < b1[1]){
            return true
        }
        else{
            return false
        }
    }
    else{
        return true
    }
}
)
//print(arr)

var temp = [0,Int.max]
var count = 1
for a in arr{
    if(a[0] >= temp[0] && a[1] < temp[1]){
        temp = a
    }
    else if temp[1] <= a[0]{
        temp = a
        count += 1
    }
    
}
print(count)
