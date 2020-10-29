import Foundation

let str = readLine()?.split(separator: " ")
let m = Int(String(str![0]))!
let n = Int(String(str![1]))!
let k = Int(String(str![2]))!
var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

for i in 1...k{
    let str1 = readLine()?.split(separator: " ")
    
    let x1 = Int(String(str1![0]))!
    let y1 = Int(String(str1![1]))!
    let x2 = Int(String(str1![2]))! - 1
    let y2 = Int(String(str1![3]))! - 1
    
    for y in y1...y2{
        for x in x1...x2{
            arr[y][x] = 1
        }
    }
}

var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var count = 0
var res = [Int]()

func bfs(_ x : Int, _ y :Int){
    var quee = [[x,y]]
    if(visit[y][x] == true || arr[y][x] == 1){
        return
    }
    visit[y][x] = true
    var size = 0
    while !quee.isEmpty {
        let ft = quee.first!
        quee.remove(at: 0)
        size += 1
        let x = ft[0]
        let y = ft[1]
        
        for i in 0...3{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if(nx>=0 && nx < n && ny>=0 && ny<m){
                if(visit[ny][nx] == false && arr[ny][nx] == 0){
                    visit[ny][nx] = true
                    let ad = [nx,ny]
                    quee.append(ad)
                }
            }
        }
    }
    res.append(size)
    count += 1
}

for y in 0...m-1{
    for x in 0...n-1{
        bfs(x, y)
    }
}

print(count)
res = res.sorted()
for i in res{
    print(i, terminator: " ")
}

