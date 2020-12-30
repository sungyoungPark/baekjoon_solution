import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0))!}

let v = input[0]
let e = input[1]

var arr = [[Int]](repeating: [Int](repeating: 1001, count: v+1), count: v+1)

for _ in 1...e{
    let str = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let start = str[0]
    let end = str[1]
    let val = str[2]
    
    arr[start][end] = val
    
}

var res = Int.max
func floyd(){  //플로이드-와샬 알고리즘
    
    for mid in 1...v{  //거쳐 가는 곳
        for start in 1...v{
            for end in 1...v{
                if(arr[start][end] > arr[start][mid] + arr[mid][end]){
                    arr[start][end] = arr[start][mid] + arr[mid][end]
                    if(start == end){
                        res = min(res, arr[start][end])
                    }
                }
            }
        }
    }
    
}

floyd()
if(res == Int.max){
    print(-1)
}
else{
    print(res)
}
