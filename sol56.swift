import Foundation

struct node{
    var my = ""
    var left = ""
    var right = ""
    init(_ my : String, _ left : String, _ right : String) {
        self.my = my
        self.left = left
        self.right = right
    }
}


var n = Int(readLine()!)

var arr = [node](repeating: node(".", ".", "."), count: 27)

for i in 1...n!{
    let input = readLine()!.split(separator: " ").map{ String($0)}
    
    let id = Int(UnicodeScalar(input[0])!.value - 64)  //아스키코드를 이용하여 대문자를 숫자로 바꿔 배열의 주소로 사용
    arr[id].my = input[0]
    arr[id].left = input[1]
    arr[id].right = input[2]


}

func VLR(_ V : Int){
    let cur = arr[V]
    print(cur.my, terminator: "")
    if(cur.left != "."){
        VLR(Int(UnicodeScalar(cur.left)!.value - 64))
    }
    if(cur.right != "."){
        VLR(Int(UnicodeScalar(cur.right)!.value - 64))
    }
}

func LVR(_ V : Int){
    let cur = arr[V]
    if(cur.left != "."){
        LVR(Int(UnicodeScalar(cur.left)!.value - 64))
    }
    print(cur.my, terminator: "")
    if(cur.right != "."){
        LVR(Int(UnicodeScalar(cur.right)!.value - 64))
    }

}

func LRV(_ V : Int){
    let cur = arr[V]
    if(cur.left != "."){
        LRV(Int(UnicodeScalar(cur.left)!.value - 64))
    }
    if(cur.right != "."){
        LRV(Int(UnicodeScalar(cur.right)!.value - 64))
    }
    print(cur.my, terminator: "")
}

VLR(1)
print()
LVR(1)
print()
LRV(1)
