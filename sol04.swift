import Foundation
var chek : [[Bool]] = []
var arr : [[Int]] = []
var dx = [-1,-1,0,1,1,1,0,-1]
var dy = [0,1,1,1,0,-1,-1,-1]
var maxX = 0
var maxY = 0
var ans = 0
var result : [Int] = []
func go(_ x : Int, _ y : Int){
    var quee = [[Int]]()
    if(chek[x][y] == true){
        return
    }
    if(arr[x][y] == 0){
        return
    }
    if(arr[x][y] == 1 && chek[x][y] == false){
     chek[x][y] = true
     quee.append([x,y])
     ans += 1
    }

    while true {
        if(quee.count == 0){
            break
        }
        let first = quee.first!
        quee.remove(at: 0)
        //print(first)
        for i in 0...7{
            if(first[0]+dx[i] >= 0 && first[0]+dx[i] < maxX && first[1]+dy[i] >= 0 && first[1]+dy[i] < maxY){
                if(arr[first[0]+dx[i]][first[1]+dy[i]] == 1 && chek[first[0]+dx[i]][first[1]+dy[i]] == false){
                    chek[first[0]+dx[i]][first[1]+dy[i]] = true
                    quee.append([first[0]+dx[i],first[1]+dy[i]])
                }
            }
            
        }

    }
    
    
}



while true{
    let input = readLine()
    if(input == "0 0"){
        break
    }
    
    let str = input?.split(separator: " ")
    let a = Int(String(str![0]))!
    let b = Int(String(str![1]))!
    maxX = b
    maxY = a
    arr = [[Int]](repeating: [Int](repeating: 0, count: a), count: b)
    chek = [[Bool]](repeating: [Bool](repeating: false, count: a), count: b)
    ans = 0
    for i in 1...b{
        let str1 = readLine()?.split(separator: " ")
        var index = 0
        for st in str1!{
            //print(Int(String(st))!)
            arr[i-1][index] = Int(String(st))!
            index += 1
        }
    }
    
    for i in 0...b-1{
        for j in 0...a-1{
            go(i,j)
        }
    }
   // go(0, 0)
    //print(arr)
    //print(chek)
    result.append(ans)
}


for i in 0...result.count-1{
    print(result[i])
}
