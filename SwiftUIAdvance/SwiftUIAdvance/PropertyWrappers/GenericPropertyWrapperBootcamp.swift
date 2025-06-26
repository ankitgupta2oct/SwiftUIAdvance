import SwiftUI

@propertyWrapper
struct GenericFileManagerProperty<T: Codable>: DynamicProperty {
  @State private var value: T?
  let key: String
  
  var wrappedValue: T? {
    get {
      value
    }

    nonmutating set {
      set(newValue: newValue)
    }
  }

  public var projectedValue: Binding<T?> {
    Binding {
      wrappedValue
    } set: { newValue in
      wrappedValue = newValue
    }
  }
  
  init(_ key: String) {
    self.key = key
    do {
      let url = FileManager.filePath(key: key)
      let data = try Data(contentsOf: url)
      let decodedData = try JSONDecoder().decode(T.self, from: data)
      _value = State(wrappedValue: decodedData)
    } catch {
      print(error)
      _value = State(wrappedValue: nil)
    }
  }
    
  private func set(newValue: T?) {
    do {
      value = newValue
      let encodedData = try JSONEncoder().encode(value)
      let url = FileManager.filePath(key: key)
      try encodedData.write(to: url)
    } catch {
      print("Error in set: \(error)")
    }
  }
}

struct GenericPropertyWrapperBootcamp: View {
  @GenericFileManagerProperty("data-model") var dataModel: GenericPropertyWrapperModel?
  
  var body: some View {
    VStack(spacing: 20) {
      Text(dataModel?.name ?? "No name")
      Button("Init Model") {
        dataModel = GenericPropertyWrapperModel(name: "Ankit", age: 20)
      }
      Button("Change Name") {
        dataModel?.name = "New Name"
      }
    }
  }
}

struct GenericPropertyWrapperModel: Codable {
  var name: String
  let age: Int
}

#Preview {
    PropertyWrapperBootcamp()
}
