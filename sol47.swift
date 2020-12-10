import Foundation

var n = Int(readLine()!)!

var input = readLine()!.split(separator: " ").map{Int(String($0))!}


input.sort()

func upper(target : Int)->Int{  //배열을 정렬 했을때 타겟이 나오는 가장 큰 인덱스 리턴
    var start = 0
    var end = n-1
    var mid = (start + end) / 2
    
    while end > start {
        mid = (start + end) / 2
        if(input[mid] > target){
            end = mid
        }
        else{
            start = mid + 1
        }
    }
    return end
    
}

func lowwer(target : Int)->Int{  //배열을 정렬 했을때 타켓이 나오는 가장 작은 인데스 리턴
    var start = 0
    var end = n-1
    var mid = (start + end) / 2
    
    while end > start {
        mid = (start + end) / 2
        if(input[mid] >= target){
            end = mid
        }
        else{
            start = mid + 1
        }
    }
    return end
}


var m = Int(readLine()!)!
var input2 = readLine()!.split(separator: " ").map{ Int(String($0))! }

var result = [Int](repeating: 0, count: m)

for i in 0...m-1{
    var a = upper(target: input2[i])
    var b = lowwer(target: input2[i])
    
    if(a == n-1 && input[n-1] == input2[i]){   //upper가 input에 마지막 위치 값을 나타내고, input 마지막 값이 타겟일때
        a += 1
    }
    
    result[i] = a - b
    
}



print(result.map{ String($0)}.joined(separator: " "))

