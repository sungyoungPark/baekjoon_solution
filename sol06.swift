import Foundation

let str = readLine()!.split(separator: " ")

let n = Int(str[0])!
let m = Int(str[1])!

var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for i in 1...n{
    let str1 = readLine()
    var index = 0
    for s in str1!{
        graph[i-1][index] = Int(String(s))!
        index += 1
    }
    
}


var dx = [-1,1,0,0] //위, 아래, 오른쪽, 좌
var dy = [0,0,1,-1]

func bfs(_ x : Int, _ y : Int)-> Int{
    var quee = [[Int]]()
    quee.append([x,y,1])
    var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var res = 0
    check[0][0] = true
    while true {
        if(quee.count == 0){
            break
        }
        let first = quee.first
        quee.remove(at: 0)
       
        if(first![0] == n-1 && first![1] == m-1){
            res = first![2]
            break
        }
        
        for i in 0...3{
            let nx = first![0] + dx[i]
            let ny = first![1] + dy[i]
            
            if(nx >= 0 && nx < n &&  ny >= 0 && ny < m){
                if(graph[nx][ny] != 0 && check[nx][ny] == false){
                    check[nx][ny] = true  //여기가 중요, 중복으로 큐에 들어가는 것을 막아주기 위함
                    quee.append([nx,ny,first![2]+1])
                }
            }
            
            
        }
        
    }
    
    return res
    
}

print(bfs(0, 0))
