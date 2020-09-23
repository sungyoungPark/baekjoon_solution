//문제를 잘 읽기
import Foundation

let n = Int(readLine()!)!

var res_max = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 100001)
var res_min = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 100001)

for i in 1...n{
    let str = readLine()?.split(separator: " ")
    
    res_max[i][0] = Int(String(str![0]))! + max(res_max[i-1][0], res_max[i-1][1])
    res_max[i][1] = Int(String(str![1]))! + max(max(res_max[i-1][0], res_max[i-1][1]),res_max[i-1][2])
    res_max[i][2] = Int(String(str![2]))! + max(res_max[i-1][1], res_max[i-1][2])
    
    res_min[i][0] = Int(String(str![0]))! + min(res_min[i-1][0], res_min[i-1][1])
    res_min[i][1] = Int(String(str![1]))! + min(min(res_min[i-1][0], res_min[i-1][1]),res_min[i-1][2])
    res_min[i][2] = Int(String(str![2]))! + min(res_min[i-1][1], res_min[i-1][2])
    
}



print(String(res_max[n].max()!) , String(res_min[n].min()!))


