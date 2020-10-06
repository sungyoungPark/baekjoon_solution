import Foundation

let strs = readLine()!

var count = 0
var ans = ""
//var flag = false

for str in strs{
    // print(str)
    if(str == "X"){
        count += 1
    }
    if(str == "."){
        if(count%2==0){
            if(count/4 > 0){
                for _ in 1...count/4 {
                    ans = ans + "AAAA"
                }
                count = count % 4
            }
            if(count/2 > 0){
                for _ in 1...count/2{
                    ans = ans + "BB"
                }
                count = 0
            }
            
        }
        else{
            print(-1)
            ans = ""
            count = 0
            ans = ""
            break
        }
        ans = ans + "."
        
    }
}

if(count%2==0 ){
    if(count/4 > 0){
        for _ in 1...count/4 {
            ans = ans + "AAAA"
        }
        count = count % 4
    }
    if(count/2 > 0){
        for _ in 1...count/2{
            ans = ans + "BB"
        }
        count = 0
    }
    print(ans)
}
else{
    print(-1)
}

