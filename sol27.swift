import Foundation

let n = Int(readLine()!)!

var fibo0 = [Int](repeating: 0, count: 41)
var fibo1 = [Int](repeating: 0, count: 41)

fibo0[0] = 1
fibo1[1] = 1

for i in 2...40{
    fibo0[i] = fibo0[i-2] + fibo0[i-1]
    fibo1[i] = fibo1[i-2] + fibo1[i-1]
}

for i in 1...n{
    let k = Int(readLine()!)!
    print(fibo0[k],fibo1[k])
}
