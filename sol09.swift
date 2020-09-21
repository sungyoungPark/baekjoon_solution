import Foundation

let x = Int(readLine()!)!

var input = [Int](repeating: 0, count: x)
var dp = [1,1,1]
var max = 0
for i in 1...x{
    let num = Int(readLine()!)!
    input[i-1] = num
    if(max < num){
        max = num
    }
}


if (max > 3){
    for i in 4...max{
        dp.append(dp[i-4] + dp[i-3])
    }
}

for i in 1...x{
    print(dp[input[i-1]-1])
}

