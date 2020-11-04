import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(String(str![0]))!
let m = Int(String(str![1]))!
let k = Int(String(str![2]))!

var arr = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var trash = [[Int]]()

for _ in 1...k{
    let str1 = readLine()?.split(separator: " ")
    let r = Int(String(str1![0]))!
    let c = Int(String(str1![1]))!
    
    arr[r-1][c-1] = 1
    let ad = [c-1,r-1]
    trash.append(ad)
}

let dx = [-1,1,0,0]
let dy = [0,0,1,-1]
var max = 0

func bfs(_ x : Int , _ y : Int){
    var quee = [[x,y]]
    visit[y][x] = true
    var count = 0
    while !quee.isEmpty {
        let ft = quee.first!
        quee.remove(at: 0)
        let x = ft[0]
        let y = ft[1]
        //print(x,y)
       
        count+=1
        
        for i in 0...3{
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if(nx>=0 && nx < m && ny>=0 && ny < n){
                if(visit[ny][nx] == false && arr[ny][nx] == 1){
                    let ad = [nx,ny]
                    visit[ny][nx] = true
                    quee.append(ad)
                }
            }
            
        }
        
    }
    if(max < count){
        max = count
    }
}



for tr in trash{
    let x = tr[0]
    let y = tr[1]
    bfs(x, y)
}


print(max)
