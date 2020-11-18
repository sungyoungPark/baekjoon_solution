import Foundation

//클라스로 정의한 큐 사용하는 것이 시간 해결의 키 
class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]){
        self.enqueue = queue
    }
    
    func push(_ n: T){
        enqueue.append(n)
    }
    
    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}

let str = readLine()!.split(separator: " ")

let m = Int(str[0])!
let n = Int(str[1])!

var arr = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var total = 0

let queue: Queue = Queue([])

for i in 0...n-1{
    
    let str1 = readLine()?.split(separator: " ")
    for j in 0...m-1{
        arr[i][j] = Int(String(str1![j]))!
        if(arr[i][j] == 1){
            queue.push([i,j,0])
        }
        if(arr[i][j] == 0){
            total += 1
        }
        
    }
}




let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func bfs()-> Int{
    var day = 0
    
    while !queue.isEmpty {
        let ft = queue.pop() as? [Int]
        
        for i in 0...3{
            let nx = ft![0] + dx[i]
            let ny = ft![1] + dy[i]
            
            if(nx >= 0 && nx < n && ny >= 0 && ny < m && arr[nx][ny] == 0){
                arr[nx][ny] = 1
                total -= 1
                queue.push([nx,ny,ft![2]+1])
            }
        }
        day = ft![2] + 1
        if(total == 0){
            break
        }
    }
    
    return day
}

if(total == 0){
    print(0)
    exit(0)
}

let res = bfs()

if(total != 0){
    print(-1)
}
else{
    print(res)
}


