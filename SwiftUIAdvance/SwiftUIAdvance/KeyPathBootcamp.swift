import SwiftUI

struct KeyPathBootcamp: View {
  @State var dataArray: [KeyPathModel] = [
    KeyPathModel(name: "Doe", count: 3),
    KeyPathModel(name: "John", count: 1),
    KeyPathModel(name: "Alice", count: 4),
    KeyPathModel(name: "Jane", count: 2)
  ]

  var body: some View {
    List {
      ForEach(dataArray) { data in
        Text("Name: \(data.name), Count: \(data.count)")
      }
    }
    .onAppear {
      dataArray = dataArray.sortedByKeyPath(\.count, ascending: true)
    }
  }
}

extension Array {
  func sortedByKeyPath<T:Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
    return self.sorted { item1, item2 in
      let value1 = item1[keyPath: keyPath]
      let value2 = item2[keyPath: keyPath]
      
      return ascending ? (value1 < value2) : (value1 > value2)
    }
  }
  
  mutating func sortByKeyPath<T:Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) {
    self.sort { item1, item2 in
      let value1 = item1[keyPath: keyPath]
      let value2 = item2[keyPath: keyPath]
      
      return ascending ? (value1 < value2) : (value1 > value2)
    }
  }
}

struct KeyPathModel: Identifiable {
  let id = UUID().uuidString
  let name: String
  let count: Int
}

#Preview {
    KeyPathBootcamp()
}
