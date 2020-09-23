import Foundation

let str = readLine()?.split(separator: " ")
let n = Int(str![0])!
let m = Int(str![1])!

var graph = [[Int]](repeating: [], count: n+1)
var count = 1
func bfs(_ v : Int) -> [Int]{
    var visit = [Bool](repeating: false, count: n+1)
    var quee = graph[v]
    for i in quee{
        visit[i] = true
    }
    visit[v] = true
    var result = [Int]()
    while (quee.count > 0)  {
       //print("q",quee)
        var flag = false
        let temp = quee
        for i in quee{
            for j in graph[i]{
                if(visit[j] == false){
                    flag = true
                    visit[j] = true
                    quee.append(j)
                }
            }
             quee.removeFirst()
        }
        
        if(flag ==  false){
            result = temp
        }
        count += 1
        
    }
    
    return result
    
}

for _ in 1...m{
    let str1 = readLine()?.split(separator: " ")
    let a1 = Int(str1![0])!
    let b1 = Int(str1![1])!
    
    graph[a1].append(b1)
    graph[b1].append(a1)
    
}

let dis = bfs(1)
print(String(dis.min()!), count-1,dis.count)
