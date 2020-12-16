import Foundation

let testCase = Int(readLine()!)!

var res = [[Int]](repeating: [], count: testCase)

for i in 0...testCase-1{
    
    let len = Int(readLine()!)!
    var input : [Int] = []
    if(len>=10){
        for _ in 0...len/10-1{
            let input1 = readLine()?.split(separator: " ").map{ Int(String($0))!}
            input = input + input1!
        }
    }
    if(len%10 != 0){
        let input1 = readLine()?.split(separator: " ").map{ Int(String($0))!}
        input = input + input1!
    }
    
    var arr = [Int](repeating: Int.max, count: len)
    for j in 0...len-1{
        arr[j] = input[j]
        if(j%2 == 0){
            arr.sort()
            res[i] = res[i] + [arr[j/2]]
            
        }
    }
}

for i in 0...testCase-1{
    print(res[i].count)
    for j in 0...res[i].count-1{
        if( (j+1)%10 != 0){
            print(res[i][j], terminator: " ")
        }
            else{
             print(res[i][j], terminator: "\n")
        }
    }
}
