import Foundation

let n = Int(readLine()!)!

func sol(_ str : String) -> Int{
    var total = 0
    var point = 0
    
    for s in str{
        if(s == "O"){
            point += 1
            total += point
        }
        else{
            point = 0
        }
    }
    return total
}


for _ in 1...n{
    let str = readLine()!
    print(sol(str))
}
