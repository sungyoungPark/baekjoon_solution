import Foundation
var count = 1
var ans = [String]()
while true{
    let m = Int(readLine()!)!
    if(m==0){
        break
    }
    
    var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: m)
    
    for i in 0...m-1{
        let str = readLine()?.split(separator: " ")
        for j in 0...m-1{
            graph[i][j] = Int(String(str![j]))!
        }
    }
    
    var quee = [[0,0]]
    var dist = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: m)
    dist[0][0] = graph[0][0]
    let dx = [-1,1,0,0]//좌,우 위, 아래
    let dy = [0,0,-1,1]
    
    while quee.count > 0 {
        let first = quee.first!
        quee.remove(at: 0)
        let x = first[0]
        let y = first[1]
     
        for i in 0...3{
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            
            if(nextX >= 0 && nextX < m && nextY >= 0 && nextY < m){
                let nextCost = dist[x][y] + graph[nextX][nextY]
                if( dist[nextX][nextY] > nextCost){
                    dist[nextX][nextY] = nextCost
                    quee.append([nextX,nextY,nextCost])
                }
            }
            
        }
        
        
    }
   // ans.append("Problem \(count): \(dist[m-1][m-1])")
   //count += 1
    print("Problem \(count):" ,dist[m-1][m-1])
    count += 1
}

/*
for i in ans{
    print(i)
}
*/


