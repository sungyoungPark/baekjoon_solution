import Foundation

let str = readLine()?.split(separator: " ")
let n = Int(String(str![0]))!
let k = Int(String(str![1]))!

var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 0...n-1{
    let str1 = readLine()?.split(separator: " ")
    for j in 0...n-1{
        graph[i][j] = Int(String(str1![j]))!
    }
}

//플로이드-와샬 알고리즘
for k in 0...n-1{  //k는 거쳐가는 노드
    for i in 0...n-1{  //i는 출발하는 노드
        for j in 0...n-1{  //j는 도착 노드
            if(graph[i][k] + graph[k][j] < graph[i][j]){
                graph[i][j] = graph[i][k] + graph[k][j]
            }
        }
    }
}

var visit = [Bool](repeating: false, count: n)
var res = Int.max
func dfs(_ node : Int, _ sum : Int, _ count: Int){
    if(count==0){
        if(res > sum){
            res = sum
        }
        return
    }
    for i in 0...n-1{
        if(visit[i]==false){
            visit[i] = true
            dfs(i, sum + graph[node][i], count-1)
            visit[i] = false
        }
    }
}

visit[k] = true
dfs(k, 0, n-1)
print(res)
