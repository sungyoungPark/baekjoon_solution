import Foundation

var str = readLine()!.map{String($0)}

var stack : [String] = []
var isopen = false  //이전 값에 "("가 나왔는지 확인하기 위함
var res = 0

for i in str{
    if(i == "("){
        stack.append(i)
        if(isopen == false){ //바로 앞에 (가 나온게 아닐때,
            isopen = true
        }
    }
    else{
        if(isopen == true){  //바로 앞에 (가 나왔으면, ) 나왔을때, 스택에 쌓인 ( 개수 추가
            stack.removeLast()
            res = res + stack.count
            isopen = false
        }
        else{  //바로 앞에 )가 나왔으면, 막대기 한토막 끝, 결과에 막도기 하나 추가
            stack.removeLast()
            res = res + 1
        }
    }
}


print(res)
