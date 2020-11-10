import Foundation

let input = readLine()?.split(separator: " ")
let t = Int(input![0])!
let n = Int(input![1])!

let day = ["Mon", "Tue", "Wed", "Thu", "Fri"]
var count = 0
if(n >= 1 ){
    for _ in 1...n{
        let str = readLine()?.split(separator: " ")
        let d1 = str![0]
        let t1 = Int(str![1])
        let d2 = str![2]
        let t2 = Int(str![3])
        
        let a = day.firstIndex(of: String(d2))! - day.firstIndex(of: String(d1))!
        
        count = count + t2! + (24*a) - t1!
    }
}
if(t - count > 48){
    print(-1)
}
else if(t-count <= 0){
    print(0)
}
else{
    print(t-count)
}

