import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(String(str![0]))!
let m = Int(String(str![1]))!

var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var virus = [[Int]]()
var block = 0
var result = Int.max

for i in 0...n-1{
    let str1 = readLine()?.split(separator: " ")
    
    for j in 0...n-1{
        arr[i][j] = Int(String(str1![j]))!
        if(arr[i][j] == 2){
            let a = [i,j]
            virus.append(a)
        }
        if(arr[i][j] == 1){
            block += 1
        }
    }
    
}

var visit = [Bool](repeating: false, count: virus.count)

func selVirus(_ k : Int, _ size : Int, _ cur : [Int]){
    
    var cur1 = cur
    cur1.append(k)
    
    if(size == 0){
        //print(cur1)
        bfs(cur1)
        return
    }
    visit[k] = true
    for i in k...virus.count-1{
        if(visit[i] == false){
            selVirus(i,size-1,cur1)
        }
    }
    visit[k] = false
}

func bfs(_ vir : [Int]){
    var quee = [[Int]]()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n),count: n)
    var count = n*n - block
    //print("count=",count)
    
    for v in vir{
        var ad = virus[v]
        ad.append(0)
        quee.append(ad)
        visited[ad[0]][ad[1]] = true
        //count -= 1
    }
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var res = 0
    
    while quee.count > 0 {
        
        let ft = quee.first!
        quee.remove(at: 0)
        let x1 = ft[0]
        let y1 = ft[1]
        let cost = ft[2]
        res = cost
        count -= 1
                
        for i in 0...3{
            let nx = x1 + dx[i]
            let ny = y1 + dy[i]
            
            if(nx>=0 && nx<n && ny>=0 && ny<n){
                if(visited[nx][ny] == false && arr[nx][ny] != 1){
                    visited[nx][ny] = true
                    let ad = [nx,ny,cost+1]
                    quee.append(ad)
                }
                
            }
            
        }
        
        
    }
    //print(res)
    //print(count)
    if(count==0){
        result = min(result, res)
    }
}


for i in 0...virus.count-1{
    selVirus(i, m-1,[])
}

if(result == Int.max){
    print(-1)
}
else{
    print(result)
}
