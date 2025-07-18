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
  
  init(_ path: KeyPath<GenericPropertyWrapperValue, FileManagerKeyPath<T>>) {
    let keyPath = GenericPropertyWrapperValue.shared[keyPath: path]
    self.init(keyPath.key)
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
//  @GenericFileManagerProperty("data-model") var dataModel: GenericPropertyWrapperModel?
  @GenericFileManagerProperty(\.userProfile) var dataModel
  
  var body: some View {
    VStack(spacing: 20) {
      Text(dataModel?.name ?? "No name")
      Button("Init Model") {
        dataModel = GenericPropertyWrapperModel(name: "Ankit", age: 20)
      }
      Button("Change Name") {
        dataModel?.name = "Vishal"
      }
    }
  }
}

struct GenericPropertyWrapperModel: Codable {
  var name: String
  let age: Int
}

final class GenericPropertyWrapperValue {
  static let shared = GenericPropertyWrapperValue()
  
  let userProfile = FileManagerKeyPath(key: "user_profile", type: GenericPropertyWrapperModel.self)
  
  private init() {}
  
}

struct FileManagerKeyPath<T:Codable> {
  let key: String
  let type: T.Type
}

#Preview {
    PropertyWrapperBootcamp()
}
