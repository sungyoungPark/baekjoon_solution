import Foundation

var n = Int(readLine()!)!

var arr = [[Int]](repeating: [], count: n)

for i in 0...n-1{
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr[i] = input
}

arr.sort {  //x값 기준으로 정렬
    if($0[0] < $1[0]){
        return true
    }
    else{
        return false
    }
}

let maxPoint = arr.max {  //가장 큰 높이를 가지는 값
    if($0[1] < $1[1]){
        return true
    }
    else{
        return false
    }
}


var index = 0

var stack = arr[0]
var size = 0

// 높이가 높아지면 넓이 더해줘야함

func left(){   //큰 값을 기준으로 왼쪽부분 넓이
    var stack = arr[0]
    
    for i in 0...arr.count-1{
        if(arr[i] == maxPoint){
            size = size + abs(arr[i][0] - stack[0])*stack[1]
            //index += 1
            break
        }
        if(stack[1] < arr[i][1]){  
            size = size + abs(arr[i][0]-stack[0])*stack[1]
            stack = arr[i]
        }
        index += 1
    }
    
}

func right(){   //큰 값을 기준으로 오른쪽부분 넓이
    var stack = arr[arr.count-1]
    for i in (index...arr.count-1).reversed(){
        if(i == index){
            size = size + abs(stack[0]-arr[i][0])*stack[1]
            break
        }
        if(stack[1] < arr[i][1]){
            size = size + abs(stack[0]-arr[i][0])*stack[1]
            stack = arr[i]
        }
        
    }
}

left()
if(index < arr.count-1){  //가장 큰 기둥이 맨 오른쪽 끝이 아니면
    right()
}


print(size + maxPoint![1])  //마지막에 가장 큰 기둥 높이*폭(1) 더 해줘야함



