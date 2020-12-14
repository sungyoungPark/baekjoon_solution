import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0))!}

let n = input[0]
let m = input[1]
let v = input[2]

var arr = [[Int]](repeating: [], count: n+1)

for _ in 0...m-1{
    let str = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let a = str[0]
    let b = str[1]
    
    arr[a].append(b)
    arr[b].append(a)
}

var visit = [Bool](repeating: false, count: n+1)

func dfs(_ start : Int){
    if(visit[start] == true){
        return
    }
    visit[start] = true
    let son = arr[start].sorted()
    print(start,terminator: " ")
    
    for i in son{
        if(visit[i] == false){
            dfs(i)
        }
    }
}


func bfs(_ start : Int){
    var queue = [start]
    var visit = [Bool](repeating: false, count: n+1)
    visit[start] = true
    
    while queue.count > 0 {
        let ft = queue[0]
        queue.remove(at: 0)
        
        visit[ft] = true
        print(ft, terminator: " ")
        
        for i in arr[ft].sorted(){
            if(visit[i] == false){
                visit[i] = true
                queue.append(i)
            }
        }
        
    }
    
}


dfs(v)
print()
bfs(v)
