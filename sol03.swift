import Foundation

let n = Int(readLine()!)!

var arr = [[String]](repeating: [String](repeating: " ", count: n), count: n)

for i in 1...n{
    
    var index = 0
    let str = readLine()!
    for j in str{
        arr[i-1][index] = String(j)
        index += 1
    }
}

//print(arr)

var x = 0
var y = 0
var index = 0
var count = 0
var ans = 0
for i in 0...n-1{  //가로
    count = 0
    index = 0
    while true {
        if(index >= n){
            break
        }
        if(arr[i][index] == "."){
            count += 1
        }
        else{
            if(count >= 2){
                ans += 1
            }
            count = 0
        }
        index += 1
    }
    
    if(count >= 2){
        ans += 1
    }
    
}
x=ans
//print(ans)
//세로
ans = 0
for i in 0...n-1{
    count = 0
    index = 0
    while true {
        if(index >= n){
            break
        }
        if(arr[index][i] == "."){
            count += 1
        }
        else{
            if(count >= 2){
                ans += 1
            }
            count = 0
        }
        index += 1
    }
    
    if(count >= 2){
        ans += 1
    }
    
}

//print(ans)
y=ans
print(x,y)
