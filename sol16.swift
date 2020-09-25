//문제 분류는 조합론이지만, dp로 풀었음
import Foundation

let testCase = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: 15), count: 15)

for i in 1...14{
    arr[0][i] = i
}
var res = [[Int]](repeating: [], count: testCase)


for i in 1...testCase{
    
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    res[i-1] = [k,n]
    
    
}

var temp = res
temp = temp.sorted(by: { (a1, b1) -> Bool in
    if(a1[0] > b1[0]){
        return true
    }
    else if(a1[0] == b1[0]){
        if(a1[1] > b1[1]){
            return true
        }
        else{
            return false
        }
    }
    else{
        return false
    }
})

let first = temp[0]

for j in 1...first[0]{
    for k in 1...14{
        arr[j][k] = arr[j][k-1] + arr[j-1][k]
    }
    
}

for re in res{
    print(arr[re[0]][re[1]])
}



