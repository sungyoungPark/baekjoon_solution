import Foundation

let n = Int(readLine()!)!

var arr = [Int](repeating: 0, count: n)
var dp = [Int](repeating: 0, count: n)
let str = readLine()?.split(separator: " ")

for i in 0...n-1{
    arr[i] = Int(String(str![i]))!
}

var max_dp = 1
var max_box = arr[0]

dp[0] = 1
if(n > 1){
    for i in 1...n-1{
        if(arr[i] > max_box){
            dp[i] = max_dp + 1
            max_box = arr[i]
            max_dp = dp[i]
        }
        else{
            dp[i] = 1
            for j in (0...i-1).reversed(){
                if(arr[i] > arr[j]){
                    dp[i] = dp[j] + 1
                    break
                }
            }
            if(max_dp < dp[i]){
                max_dp = dp[i]
                max_box = arr[i]
            }
        }
    }
    
}

//print(arr)
print(dp.max()!)
