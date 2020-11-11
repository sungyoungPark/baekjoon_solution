import Foundation

let str = readLine()?.split(separator: " ").map{Int($0)}

var set = Set<String>()
var res = [String]()
for _ in 1...str![0]!{
    let str1 = readLine()!
    set.insert(str1)
}

for _ in 1...str![1]!{
    let str1 = readLine()!
    if(set.contains(str1) == true){
        res.append(str1)
    }
}

print(res.count)
res = res.sorted()
for i in res{
    print(i)
}
