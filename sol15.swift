import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(str![0])!
let m = Int(str![1])!

var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for i in 1...n{
    let str1 = readLine()
    var index = 0
    for j in str1!{
        graph[i-1][index] = Int(String(j))!
        index += 1
        
    }
    
}


func bfs(_ x: Int, _ y: Int)-> Int{
    var visit1 = [[Bool]](repeating: [Bool](repeating: false, count: 1001), count: 1001) //벽 뿌수고 이동용
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: 1001), count: 1001)
    var quee : [[Int]] = [[x,y,1,1]]
    visit[x][y] =  true
    visit[x][y] =  true
    
    while quee.count > 0 {
        let first = quee.first!
        let x1 = first[0]
        let y1 = first[1]
        let chance = first[2]
        let len = first[3]
        quee.remove(at: 0)
        
        if(x1 == n-1 && y1 == m-1){
            return len
        }
        //벽 뿌수고 이동하면, visit1로 체크해야함. 벽을 뿌수고 이동했을때와 안 뿌수고 이동했을떄 visit이 같으면 중복으로 방문하였을떄, 예외가 생길 수 있기 때문이다. 
        //https://www.acmicpc.net/board/view/48468
        if(chance == 1){
            if(x1+1 < n && visit[x1+1][y1] == false){ //아래로 이동
                if(graph[x1+1][y1] == 1){
                    visit[x1+1][y1] = true
                    quee.append([x1+1,y1,0,len+1])
                }
                else if(graph[x1+1][y1] == 0 ){
                    visit[x1+1][y1] = true
                    quee.append([x1+1,y1,chance,len+1])
                }
                
            }
            if(x1-1 >= 0 && visit[x1-1][y1] ==  false){  //위로 이동
                if(graph[x1-1][y1] == 1 ){
                    visit[x1-1][y1] = true
                    quee.append([x1-1,y1,0,len+1])
                }
                else if(graph[x1-1][y1] == 0 ){
                    visit[x1-1][y1] = true
                    quee.append([x1-1,y1,chance,len+1])
                }
            }
            
            if(y1-1 >= 0 && visit[x1][y1-1] ==  false){  //좌로 이동
                if(graph[x1][y1-1] == 1){
                    visit[x1][y1-1] = true
                    quee.append([x1,y1-1,0,len+1])
                }
                else if(graph[x1][y1-1] == 0 ){
                    visit[x1][y1-1] = true
                    quee.append([x1,y1-1,chance,len+1])
                }
            }
            
            if(y1+1 < m && visit[x1][y1+1] ==  false){  //우로 이동
                if(graph[x1][y1+1] == 1){
                    visit[x1][y1+1] = true
                    quee.append([x1,y1+1,0,len+1])
                }
                else if(graph[x1][y1+1] == 0 ){
                    visit[x1][y1+1] = true
                    quee.append([x1,y1+1,chance,len+1])
                }
            }
            
            
        }
        if(chance == 0){  
            if(x1+1 < n && visit1[x1+1][y1] == false){ //아래로 이동
                if(graph[x1+1][y1] == 0 ){
                    visit1[x1+1][y1] = true
                    quee.append([x1+1,y1,chance,len+1])
                }
                
            }
            if(x1-1 >= 0 && visit1[x1-1][y1] ==  false){  //위로 이동
               if(graph[x1-1][y1] == 0 ){
                    visit1[x1-1][y1] = true
                    quee.append([x1-1,y1,chance,len+1])
                }
            }
            
            if(y1-1 >= 0 && visit1[x1][y1-1] ==  false){  //좌로 이동
                if(graph[x1][y1-1] == 0 ){
                    visit1[x1][y1-1] = true
                    quee.append([x1,y1-1,chance,len+1])
                }
            }
            
            if(y1+1 < m && visit1[x1][y1+1] ==  false){  //우로 이동
                 if(graph[x1][y1+1] == 0 ){
                    visit1[x1][y1+1] = true
                    quee.append([x1,y1+1,chance,len+1])
                }
            }
            
        }
        
    }
    
    return -1
}

print(bfs(0, 0))

