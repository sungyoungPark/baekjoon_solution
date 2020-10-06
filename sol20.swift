import Foundation

let n = Int(readLine()!)!

let m = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)

for i in 1...m{
    let str = readLine()?.split(separator: " ")
    
    let a = Int(str![0])
    let b = Int(str![1])
    let cost = Int(str![2])
    
    if(graph[a!][b!] > cost!){
        graph[a!][b!] = cost!
    }
    
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

for i in 1...n{
    let dis = dijkstra(i)
    
    for j in 1...n{
        if(dis[j] == Int.max){
            print(0, terminator: " ")
        }
        else{
            print(dis[j], terminator: " ")
        }
    }
    print()
}
