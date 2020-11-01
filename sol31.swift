import Foundation
// dfs + dp 문제

let str = readLine()?.split(separator: " ")

let m = Int(String(str![0]))!
let n = Int(String(str![1]))!

var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

for i in 0...m-1{
    let str1 = readLine()?.split(separator: " ")
    for j in 0...n-1{
        arr[i][j] = Int(String(str1![j]))!
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)


func sol(_ x : Int, _ y : Int)->Int{
    if(x==0 && y==0){
        return 1
    }
    if(dp[y][x] == -1){
        dp[y][x] = 0
        for i in 0...3{
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if(nx>=0 && nx<n && ny>=0 && ny<m && arr[y][x] < arr[ny][nx]){
                dp[y][x] = dp[y][x] + sol(nx, ny)
            }
        }
    }
    return dp[y][x]
}

print(sol(n-1, m-1))

