import SwiftUI

extension FileManager {
  static func filePath(key: String) -> URL {
    self.default
      .urls(for: .documentDirectory, in: .userDomainMask)
      .first!
      .appending(path: "\(key).txt")
  }
}

@propertyWrapper
struct FileManagerProperty: DynamicProperty {
  @State private var tittle: String
  let key: String
  
  var wrappedValue: String {
    get {
      tittle
    }
    
    nonmutating set {
      set(value: newValue)
    }
  }
  
  public var projectedValue: Binding<String> {
    Binding {
      wrappedValue
    } set: { newValue in
      wrappedValue = newValue
    }
  }
  
  init(wrappedValue: String, _ key: String) {
    self.key = key
    do {
      print(NSHomeDirectory())
      tittle = try String(contentsOf: FileManager.filePath(key: key), encoding: .utf8)
    } catch {
      print(error)
      tittle = wrappedValue
    }
  }
    
  private func set(value: String) {
    do {
      try tittle.write(to: FileManager.filePath(key: key), atomically: false, encoding: .utf8)
      tittle = value
    } catch {
      print("Error in set: \(error)")
    }
  }
}

struct PropertyWrapperBootcamp: View {
  @FileManagerProperty("first") var tittle: String = "Initial Value"
  
  var body: some View {
    VStack(spacing: 20) {
      Text(tittle)
      Button("Set Label 1") {
        tittle = "Tittle 1"
      }
      Button("Set Label 2") {
        tittle = "Tittle 2"
      }
      PropertyWrapperSubView(subViewTittle: $tittle)
    }
  }
}

struct PropertyWrapperSubView: View {
  @Binding var subViewTittle: String
  var body: some View {
    VStack {
      Text("SubView \(subViewTittle)")
      Button("Change Titlle") {
        subViewTittle = "abc"
      }
    }
  }
}

#Preview {
    PropertyWrapperBootcamp()
}
