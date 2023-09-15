func swap(integers: inout [Int], firstIndex: Int, secondIndex: Int) {
    let temp = integers[firstIndex]
    integers[firstIndex] = integers[secondIndex]
    integers[secondIndex] = temp
}


func mergeSort(integers: inout [Int]) {
    var split = [[Int]]() 
    for leftIndex in stride(from: 0, to: integers.count, by: 2) {
        if (leftIndex+1 < integers.count) {
            // print("\(integers[leftIndex]) <=> \(integers[leftIndex+1])")
            split.append([integers[leftIndex], integers[leftIndex+1]])
        } else {
            // print(integers[leftIndex])
            split.append([integers[leftIndex]])
        }
    }
    // print(split)
    // var merged = [[Int]]()
    let a = merge(split: &split)
    // let b = merge(split: &a)

    integers = a[0]
    
}


func merge(split: inout [[Int]]) -> [[Int]] {
    var ans = [[Int]]()
    for i in stride(from: 0, to: split.count, by: 2) {
        if i+1 < split.count {
            var a1 = 0
            var a2 = 0
            
            if (split[i].count == 2 && split[i][0] > split[i][1]) {
                swap(integers: &split[i], firstIndex: 0, secondIndex: 1)
            }
            
            if (split[i+1].count == 2 && split[i+1][0] > split[i+1][1]) {
                swap(integers: &split[i+1], firstIndex: 0, secondIndex: 1)
            }
            // print(i)
            // print("\(split[i]) <=> \(split[i+1])")
            var temp = [Int]()
            
            while (a1 < split[i].count && a2 < split[i+1].count) {
                
                if(split[i][a1] < split[i+1][a2]) {
                    temp.append(split[i][a1])
                    a1 += 1
                } else {
                    temp.append(split[i+1][a2])
                    a2 += 1
                }
                
            }
            if a1 >= split[i].count {
                for z in a2..<split[i+1].count {
                    temp.append(split[i+1][z])
                }
            }
            if a2 >= split[i+1].count {
                for z in a1..<split[i].count {
                    temp.append(split[i][z])
                }
            }
            // print("temp: \(temp)")
            ans.append(temp)
        }
        
    }
    while ans.count > 1 {
        ans = merge(split: &ans)
    } 
    return ans
}


var a = [-3, -6, 4, 2, 6, -44, -73, 3, 5, 3, 8, -2443, 5, 3456, 222, 33]
mergeSort(integers: &a)
print(a)
