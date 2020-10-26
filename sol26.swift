import Foundation

let count = Int(readLine()!)!

for _ in 1...count{
    let str = readLine()?.split(separator: " ")
    var hp = Int(str![0])! + Int(str![4])!
    var mp = (Int(str![1])! + Int(str![5])!)
    var atk = (Int(str![2])! + Int(str![6])!)
    let def =  (Int(str![3])! + Int(str![7])!)
    if(hp < 1){
        hp = 1
    }
    if(mp<1){
        mp = 1
    }
    if(atk < 0){
        atk = 0
    }
 
    print(hp+5*mp+2*atk+2*def)
}


