import SwiftUI

@propertyWrapper
struct UpperCase: DynamicProperty {
  @State var value: String
  
  var wrappedValue: String {
    get {
      value
    }
    
    nonmutating set {
      value = newValue.uppercased()
    }
  }
  
  init(wrappedValue: String) {
    self.value = wrappedValue.uppercased()
  }
}

struct UppercasePropertyWrapper: View {
  
  @UpperCase var title: String = "hello world"
  
    var body: some View {
      Text(title)
      Button("Change") {
        title = "asd"
      }
    }
}

#Preview {
    UppercasePropertyWrapper()
}
