import Foundation

var input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0]
var count = input[1]

var temp = 1
var add = 1
var remain = 0

var res = "-1"

for i in 1...n{
    if(temp*10 > i){
        remain = remain + add
    }
    else if(temp*10 <= i){
        add += 1
        temp *= 10
        remain = remain + add
    }
    
    if(remain >= count){   //현재 i 값이 타겟 자리수를 포함하고 있을때
        let str = String(i)
        //print(str ,str.count-1 - (remain-count))
        res = String(str[str.index(str.startIndex, offsetBy: str.count-1 - (remain-count))])  // 뒤에서부터 자리수 확인, remain이 count와 같으면 맨 마지막 자리가 타겟 위치
        break
    }
    
}

print(res)
