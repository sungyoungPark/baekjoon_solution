import Foundation

let strs = readLine()!

var frames = [[Int]](repeating: [Int](repeating: -1, count: 2), count: 13)

var spare = [Int]()
var strike = [Int]()
var frame = 0
var isNext = false

for str in strs{
    if(str == "S"){ //스트라이크
        frames[frame][0] = 10
        frames[frame][1] = -1  //횟수로 추가하지 않기 위함
        strike.append(frame)
        frame += 1
        isNext = false
    }
    
    else if(str == "P"){ //스페어
        frames[frame][1] = 10 - frames[frame][0]
        spare.append(frame)
        frame += 1
        isNext = false
    }
    else if(str == "-"){
        if(isNext == false){
                  frames[frame][0] = 0
                  isNext = true
              }
              else{
                  frames[frame][1] = 0
                  isNext = false
                  frame += 1
              }
    }
    else{  //일반
        if(isNext == false){
            frames[frame][0] = Int(String(str))!
            isNext = true
        }
        else{
            frames[frame][1] = Int(String(str))!
            isNext = false
            frame += 1
        }
    }
    
    
    
}

var point = [Int](repeating: 0, count: 12)

for i in 0...11{
    for j in 0...1{
        if(frames[i][j] == -1){
            break
        }
        else{
            point[i] = point[i] + frames[i][j]
        }
    }
}

for st in strike{
    if(st >= 10){
        break
    }
    if(frames[st+1][1] == -1){
        point[st] = point[st] + frames[st+1][0] + frames[st+2][0]
    }
    else{
        point[st] = point[st] + frames[st+1][0] + frames[st+1][1]
    }
}

for sp in spare{
    point[sp] = point[sp] + frames[sp+1][0]
}

//print(spare)
//print(frames)
//print(strike)
//print(point)
var res = 0
for i in 0...9{
    res = res + point[i]
}
print(res)
