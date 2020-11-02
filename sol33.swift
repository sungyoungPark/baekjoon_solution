import Foundation

let n = Int(readLine()!)!

let str = readLine()!.map {String($0)}
var res = 0
var i = 0

while i < n{
    //print(i)
    if(str[i] == "S"){
        res += 1
        i += 1
    }
    else if(str[i] == "L"){
        res += 1
        i += 2
    }
}
res += 1
if( res > n){
    print(n)
}
else{
    print(res)
}

