import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(str![0])!
let m = Int(str![1])!

var graph = [[Int]](repeating: [], count: n+1)

for _ in 1...m{
    let str1 = readLine()?.split(separator: " ")
    let u = Int(str1![0])!
    let v = Int(str1![1])!
    
    graph[u].append(v)
    graph[v].append(u)
}

var visit = [Bool](repeating: false, count: n+1)

var quee = [Int]()
var count = 0

for i in 1...n{
    if(visit[i] == false){
        visit[i] = true
        quee = graph[i]
        
        while quee.count > 0 {
            let first = quee.first!
            quee.remove(at: 0)
            visit[first] = true
            for i in graph[first]{
                if(visit[i] == false){
                    visit[i] = true
                    quee.append(i)
                }
            }
        }
        count += 1
    }
}

print(count)


