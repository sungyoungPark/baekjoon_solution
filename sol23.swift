import Foundation

let n = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 1...n{
    let str = readLine()?.split(separator: " ")
    
    for j in 1...n{
        graph[i-1][j-1] = Int(String(str![j-1]))!
    }
    
}

let dx = [-1,1,0,0]//좌,우, 위,아래
let dy = [0,0,-1,1]

var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

func dfs(_ x : Int,_ y : Int)->Int{
    if(visit[x][y] == true){
        return dp[x][y]
    }
    visit[x][y] = true
   
    for i in 0...3{
        if(x + dx[i] >= 0 && x + dx[i] < n && y + dy[i] >= 0 && y + dy[i] < n){
            if(graph[x][y] < graph[x + dx[i]][y + dy[i]]){
                dp[x][y] = max(dp[x][y], 1 + dfs(x + dx[i], y + dy[i]))
                
            }
        }
        
    }
    return dp[x][y]
}

var ans = 0
for i in 0...n-1{
    for j in 0...n-1{
       ans = max(ans,dfs(i, j))
    }
}

//print(dp)
print(ans)
