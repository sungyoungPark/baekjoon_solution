import Foundation
//참고 : https://bingorithm.tistory.com/5  , https://wjdgus2951.tistory.com/59
let n = Int(readLine()!)!
var node = [[Int]](repeating: [Int](repeating: -1, count: 2), count: n+1) //부모 노드 저장//최고 부모 노드는 -1

let str1 = readLine()?.split(separator: " ") //중위
let str2 = readLine()?.split(separator: " ") //후위

var inorder = [Int](repeating: 0, count: 100001)
var postorder = [Int](repeating: 0, count: 100001)
var position = [Int](repeating: 0, count: 100001)

for i in 1...n{
    inorder[i-1] = Int(String(str1![i-1]))!
    postorder[i-1] = Int(String(str2![i-1]))!
    position[inorder[i-1]] = i-1
}


func sol(_ inst : Int, _ inend : Int,_ post : Int, _ poend : Int ){
    if( inst > inend || post > poend){
        return
    }
    print(postorder[poend], terminator: " ")
   
    let index = position[postorder[poend]]
    let left = index-inst
    
    
    sol(inst,index-1,post,post+left-1)
   
    sol(index+1,inend,post+left,poend-1)
    
}

sol(0,n-1,0,n-1)
