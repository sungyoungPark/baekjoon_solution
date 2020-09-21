import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 16)
//dp[i] = i일 동안 최대 pay
for i in 1...n{
    let str = readLine()?.split(separator: " ")
    let day = Int(str![0])!
    let pay = Int(str![1])!
    //상담이 진행되는 동안에 날에 dp가 0으로 표현되는 것을 막기 위해, 상담이 진행되는 동안의 날의 dp는 상담 시작 전날에 dp와 기존의 dp와 비교해서
    //최대값을 갱신해줘야 함
    for j in i...i+day-1{
        if(j<16){
        dp[j] = max(dp[j],dp[j-1])
        }
    }
    if(i+day-1<16){
    dp[i+day-1] = max(dp[i-1] + pay,  dp[i+day-1])
    //상담이 끝나는 날에 최대 pay는 업무 시작 전일인 i-1에 pay(dp[i-1]) + pay이다. 이 값을 기존 상담이 끝나는 날에 pay와 비교
    }
}

var res = 0
for i in 1...n{
    if(res < dp[i]){
        res = dp[i]
    }
}

//print(dp)
print(res)
