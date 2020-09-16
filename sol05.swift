import Foundation

let str = readLine()!.split(separator: " ")

let n = Int(str[0])!
let m = Int(str[1])!

var graph = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)


for i in 1...m{
    let s = readLine()!.split(separator: " ")
    
    let x = Int(s[0])
    let y = Int(s[1])
    
    graph[x!][y!] = 1
    graph[y!][x!] = 1
}

func dijkstra(_ v : Int) -> [Int]{
    var dis = [Int](repeating: 0, count: n+1)
    var visit = [Bool](repeating: false, count: n+1)
    
    for i in 1...n{
        dis[i] = Int.max
    }
    dis[v] = 0
    visit[v] = true
    
    for i in 1...n{
        if(visit[i] == false && graph[v][i] != Int.max){
            dis[i] = graph[v][i]
        }
    }
 
    for _ in 1...n{
        var min = Int.max
        var index = 0
        
        for j in 1...n{
            if(visit[j] == false && dis[j] != Int.max){
                if(dis[j] < min){
                    min = dis[j];
                    index = j
                }
            }
        }
        
        visit[index] = true
        if(index == 0){
            break
        }
        
        for j in 1...n{
            if(visit[j]==false && graph[index][j] != Int.max){
                if(dis[j]>dis[index] + graph[index][j]){
                    dis[j] = dis[index] + graph[index][j]
                }
            }
        }
    }
    return dis
}
var min = Int.max
var min_index = 0
for i in 1...n{
    let dis = dijkstra(i)
    var sum = 0
    for j in 1...n{
        sum = sum + dis[j]
    }
    if(sum < min){
        min = sum
        min_index = i
    }
}

print(min_index)
