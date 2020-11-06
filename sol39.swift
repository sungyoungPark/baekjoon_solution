import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var edge = [[Int]]()

for _ in 1...m{
    let str = readLine()?.split(separator: " ")
    let a = Int(String(str![0]))!
    let b = Int(String(str![1]))!
    let cost = Int(String(str![2]))!
    let ad = [a,b,cost]
    edge.append(ad)
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
for i in 0...m-1{
    let ed = edge[i]
    
    if(find(ed[0]) != find(ed[1])){
        union(ed[0], ed[1])
        res += ed[2]
    }
    
    
}
print(res)
