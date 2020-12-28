import Foundation

var input1 = readLine()!.split(separator: " ").map{ Int64(String($0))! }

var arr = readLine()!.split(separator: " ").map{ Int64(String($0))! }

var result : Int64 = 0
var target = input1[1]

var maxHeight : Int64 = 1000000000
var minHeight : Int64 = 0

func calc(_ mid : Int64)-> Int64{  //기준 높이를 통하여 얻을 수 있는 벌목된 나무 길이 구하기
    var val : Int64 = 0
    
    for i in arr{
        if(i > mid){
            val = val + i - mid
        }
    }
    return val
}

var mid : Int64 = 0  //예상하는 절단 기준 높이
while(maxHeight >= minHeight){
    mid = (maxHeight + minHeight) / 2
    let check = calc(mid)
    if(check < target){  //taraget보다 벌목된 양이 적으면 최고점을 mid-1로 낮춘다.
        maxHeight = mid-1
    }
    else{   //target보다 벌목된 양이 많으면 최저점을 mid+1로 높인다.
        minHeight = mid+1
        result = max(result, mid) //현재 result와 비교하여 높은 값으로 갱신
    }
    
}


print(result)
