import Foundation

let str = readLine()?.split(separator: " ")

let n = Int(str![0])!//배열 크기
let l = Int(str![1])!//초과
let r = Int(str![2])!//이하

var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for i in 1...n{
    let add = readLine()?.split(separator: " ")
    for j in 1...n{
        graph[i-1][j-1] = Int(String(add![j-1]))!
    }
}
var flag = false
var mysum = 0
var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var points : [[Int]] = []
var ans = 0


func go(_ x : Int, _ y : Int,_ sum : Int, _ count : Int){
    if(check[x][y] == true){
        return
    }
    
    check[x][y] = true
    points.append([x,y])
    mysum = sum + graph[x][y]
    
    if(y+1 < n && abs(graph[x][y] - graph[x][y+1]) >= l && abs(graph[x][y] - graph[x][y+1]) <= r ){
        flag = true
        go(x,y+1,mysum,count+1)
    }
    if(x+1 < n && abs(graph[x][y] - graph[x+1][y]) >= l && abs(graph[x][y] - graph[x+1][y]) <= r ){
        flag = true
        go(x+1,y,mysum,count+1)
    }
    if(x-1 >= 0 && abs(graph[x][y] - graph[x-1][y]) >= l && abs(graph[x][y] - graph[x-1][y]) <= r ){
        flag = true
        go(x-1,y,mysum,count+1)
    }
    if(y-1 >= 0 && abs(graph[x][y] - graph[x][y-1]) >= l && abs(graph[x][y] - graph[x][y-1]) <= r ){
        flag = true
        go(x,y-1,mysum,count+1)
    }
    return
}



var bigflag = false
//print(graph)

while true{
    flag = false
    check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for i in 0...n-1{ //x
        for j in 0...n-1{ //y
            points = []
            go(i,j,0,0)
            if(points.count > 1){
                //print(points.count,mysum)
                //print(points)
                for point in points{  //한 점에서 조건의 만족하는 점들의 인구수를 변경 
                    graph[point[0]][point[1]] = mysum / points.count
                }
                //print(graph)
                //print("//////")
            }
        }
    }
    
    if(flag == false){
        break
    }
    ans += 1
}

//print("///")
//go(0,0,0,0)
//print(graph)
print(ans)
