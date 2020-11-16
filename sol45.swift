import Foundation

let n = Int(readLine()!)!

var arr = [[String]](repeating: [String](repeating: " ", count: n), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

var dx = [-1,1,0,0]
var dy = [0,0,1,-1]

func check(_ x : Int, _ y : Int){  //적록색맹이 아닐때
    let char = arr[x][y]
    visit[x][y] = true
    var quee = [[x,y]]
    
    while !quee.isEmpty {
        let ft = quee.first!
        quee.remove(at: 0)
        
        for i in 0...3{
            let nx = ft[0] + dx[i]
            let ny = ft[1] + dy[i]
            if(nx >= 0 && nx < n && ny >= 0 && ny < n && visit[nx][ny] == false && arr[nx][ny] == char){
                visit[nx][ny] = true
                quee.append([nx,ny])
            }
        }
    }
    
}


func check1(_ x : Int, _ y : Int){  //적록색맹일때
    visit[x][y] = true
    var quee = [[x,y]]
    
    while !quee.isEmpty {
        let ft = quee.first!
        quee.remove(at: 0)
        
        for i in 0...3{
            let nx = ft[0] + dx[i]
            let ny = ft[1] + dy[i]
            if(nx >= 0 && nx < n && ny >= 0 && ny < n && visit[nx][ny] == false){
                if(arr[nx][ny] == "R" || arr[nx][ny] == "G"){
                    visit[nx][ny] = true
                    quee.append([nx,ny])
                }
            }
        }
    }
    
}



for i in 0...n-1{
    
    let str = readLine()
    var index = 0
    
    for s in str!{
        arr[i][index] = String(s)
        index += 1
    }
    
}
var res = 0
for i in 0...n-1{
    for j in 0...n-1{
        if(visit[i][j] == false){
            check(i, j)
            res += 1
        }
    }
}

visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

var res1 = 0
for i in 0...n-1{
    for j in 0...n-1{
        if(visit[i][j] == false){
            if(arr[i][j] == "R" || arr[i][j] == "G"){
            check1(i, j)
            res1 += 1
            }
            else{
                check(i, j)
                res1 += 1
            }
        }
      
    }
}

print(res , res1)

