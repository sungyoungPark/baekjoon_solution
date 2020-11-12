import Foundation

let n = Int(readLine()!)!

let m = Int(readLine()!)!
var parent = [Int](repeating: 0, count: n+1)

for i in 1...n{
    parent[i] = i
}

func find(_ x : Int)->Int{
    if(parent[x] == x){
        return x
    }
    else{
        parent[x] = find(parent[x])
        return parent[x]
    }
}

func union(_ x : Int, _ y: Int){
    let x1 = find(x)
    let y1 = find(y)
    if(x1 != y1 ){
        parent[y1] = x1
    }
}



for i in 1...n{
    let str = readLine()?.split(separator: " ")
    for j in 1...n{
        if(str![j-1] == "1"){
            union(i, j)
        }
    }
}


let str1 = readLine()?.split(separator: " ")
var temp = find(Int(String(str1![0]))!)

for i in 1...m-1{
    if(temp != find(Int(String(str1![i]))!)){
        print("NO")
        break
    }
    if(i==m-1){
        print("YES")
    }
}


