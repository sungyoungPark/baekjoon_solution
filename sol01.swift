import Foundation

let str = readLine()?.split(separator: " ")

let x = Int(str![0])!//가로
let y = Int(str![1])!//세로

var graph = [[String]](repeating: [String](repeating: "0", count: y), count: x)

for i in 1...x{
    let add = readLine()?.split(separator: " ")
    for j in 1...y{
        graph[i-1][j-1] = String(add![j-1])
    }
}

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]
var mi = Int.max

func go(_ x1 : Int , _ y1 : Int, _ graph : [[String]]){  //그래프
    //print("go")
    if(x1 >= x-1 && y1 >= y-1){      //그래프에 끝까지 갔을때
       // print("끝")
       // print("fin",graph)
        check(graph)
        return
    }
    var startY = y1
    var startX = x1
    if(y1 >= y){
        startY = 0
        startX += 1
    
    }
    var nw = graph
    for j in startX...x-1{
        for i in startY...y-1{
            if(graph[j][i] != "0" && graph[j][i] != "6" && graph[j][i] != "#"){     //cctv 발견
                let type = graph[j][i]
              //  print("type" ,type)
                
                switch type {
                case "1":
                    
                    for k in 0...3{
                        nw = move(k,j,i,graph)
                        go(j,i+1,nw)
                    }
                    break
                case "2":
                  
                    for k in 0...1{
                        nw = move(k,j,i,graph)
                        nw = move((k+2)%4,j,i, nw)
                        go(j,i+1,nw)
                    }
                    break
                case "3":
                    
                    for k in 0...3{
                        nw = move(k,j,i,graph)
                        nw = move((k+1)%4,j,i, nw)
                        go(j,i+1,nw)
                    }
                    break
                case "4":
                   
                    for k in 0...3{
                        nw = move(k,j,i,graph)
                        nw = move((k+1)%4,j,i, nw)
                        nw = move((k+3)%4,j,i, nw)
                        go(j,i+1,nw)
                    }
                    break
                case "5":
                    
                    nw = move(0, j,i,graph)
                    nw = move(1, j,i,nw)
                    nw = move(2,j,i, nw)
                    nw = move(3,j,i, nw)
                    go(j,i+1,nw)
                    break
                default:
                    break
                }
               // print("to")
                return
            }
            
        }
        
        startY = 0
    }
    
    check(nw)
    
}

func move(_ dir : Int,_ x1 : Int,_ y1 : Int ,_ graph : [[String]]) ->[[String]]{
    var nw = graph
    var myX = x1 + dx[dir]
    var myY = y1 + dy[dir]
    while true {
       // print("move", myX,myY)
        if(myX >= x || myY >= y || myX < 0 || myY < 0 ){
           // print("while fin")
            break
        }
        if(nw[myX][myY] == "0"){
            nw[myX][myY] = "#"
        }
         if(nw[myX][myY] == "6"){
            break
        }
        myX = myX + dx[dir]
        myY = myY + dy[dir]
    }
    return nw
}

func check(_ graph : [[String]]){
    var count = 0
    for i in 0...x-1{
        for j in 0...y-1{
            if(graph[i][j] == "0"){
                count += 1
            }
        }
    }
   mi = min(count, mi)
}

go(0,0,graph)
print(mi)
//print(graph)
