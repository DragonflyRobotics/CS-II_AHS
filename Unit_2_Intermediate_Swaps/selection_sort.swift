func selectionSort(integers: inout [Int]) {
  for cursor in 0..<integers.count {
    print(integers)
    var min = Int.max
    var argmin = -1
    for search in cursor..<integers.count {
      if integers[search] < min {
        min = integers[search]
        argmin = search
      }
    }
    
    swap(integers: &integers, firstIndex: argmin, secondIndex:cursor)
  }

}
