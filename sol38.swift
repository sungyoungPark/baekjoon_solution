import Foundation

let n = Int(readLine()!)!

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
            if(graph[i][k] == 1 && graph[k][j] == 1 ){
                graph[i][j] = 1
            }
        }
    }
}

for gr in graph{
    for g in gr{
        print(g, terminator: " ")
    }
    print()
}

