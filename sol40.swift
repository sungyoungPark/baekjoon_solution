import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(str![0])!
let m = Int(str![1])!

var edge = [[Int]](repeating: [], count: m)

for i in 0...m-1{
    let str = readLine()?.split(separator: " ")
    let a = Int(String(str![0]))!
    let b = Int(String(str![1]))!
    let cost = Int(String(str![2]))!
    let ad = [a,b,cost]
    edge[i] = ad
}

edge = edge.sorted(by: { (a, b) -> Bool in
    if(a[2] > b[2]){
        return false
    }
    else{
        return true
    }
})


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
var res = 0
var count = 0

while count < n-2{
    let ed = edge.first!
    edge.remove(at: 0)
    if(find(ed[0]) != find(ed[1])){
        union(ed[0], ed[1])
        res += ed[2]
        count += 1
    }
    
}

print(res)
