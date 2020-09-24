import Foundation

let str = readLine()?.split(separator: " ")
let n = Int(str![0])!
let k = Int(str![1])!


func bfs(_ v : Int)->Int{
    var visit = [Bool](repeating: false, count: 100001)
    var quee = [[Int]]()
    visit[v] = true
    quee.append([v,0])
  
    while quee.count > 0 {
        let first = quee.first
        quee.remove(at: 0)
        let a = first![0]
        let b = first![1]
        if(a == k){
            return b
        }
        else{
            if(a-1 >= 0 && visit[a-1] == false){
                visit[a-1] = true
                quee.append([a-1,b+1])
            }
            if(a+1 <= 100000 && visit[a+1] == false){
                visit[a+1] = true
                quee.append([a+1,b+1])
            }
            if(2*a <= 100000 && visit[2*a] == false){
                visit[2*a] = true
                quee.append([2*a,b+1])
            }
        }
        
        
    }
    
    return 0
}

print(bfs(n))
