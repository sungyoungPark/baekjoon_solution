import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n+1)

for i in 1...m{
    let str = readLine()?.split(separator: " ")
    let a = Int(str![0])!
    let b = Int(str![1])!
    
    graph[a].append(b)
    graph[b].append(a)
}

var visit = [Bool](repeating: false, count: n+1)
var quee = [[Int]]()
var count = 0
visit[1] = true

for i in graph[1]{
    quee.append([i,1])
    visit[i] = true
    count += 1
}

while quee.count > 0{
    let first = quee.first!
    quee.remove(at: 0)
    
    let len  = first[1]
    if(len<2){
        for i in graph[first[0]]{
            if(visit[i] == false){
                visit[i] = true
                quee.append([i,len+1])
                count += 1
            }
        }
    }
    
    
}

print(count)
