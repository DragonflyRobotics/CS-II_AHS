func insertionSort(integers: inout [Int]) {
  for selectedIndex in 1..<integers.count {
    print(integers)
    var currentIndex = selectedIndex
    
    while (currentIndex - 1 >= 0 && integers[currentIndex-1] > integers[currentIndex]) {
        swap(integers: &integers, firstIndex: currentIndex-1, secondIndex: currentIndex)
        currentIndex -= 1
    }
  }
  print(integers)
}
