import Foundation

class node {
    var parent = 0
    var son : [Int] = []
    
    init(_ parent : Int, _ son : [Int]) {
        self.parent = parent
        self.son = son
    }
    
}


var n = Int(readLine()!)!

var arr = [[Int]](repeating: [], count: n+1)

for i in 0...n-2{
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let a = input[0]
    let b = input[1]
    
    arr[a].append(b)
    arr[b].append(a)
    
}

var res = [Int](repeating: -1, count: n+1)
res[1] = 0

var ft = node(1,arr[1])
var queue = [ft]


while queue.count > 0{
    let first = queue[0]
    queue.remove(at: 0)
    let par = first.parent
    let son = first.son
    
    for i in son{
        if(res[i] == -1){
           res[i] = par
            if(arr[i] != []){
                let add = node(i, arr[i])
                queue.append(add)
            }
        }
    }
    
}

for i in 2...n{
    print(res[i])
}


