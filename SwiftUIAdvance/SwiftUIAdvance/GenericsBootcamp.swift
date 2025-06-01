//

import SwiftUI

struct GenericsBootcamp: View {
  @State var data = CustomModel(data: 3534.0)
  
    var body: some View {
      VStack {
        CustomView(content: Text(data.data?.description ?? "No Data"))
        Button("Clear") {
          data.removeData()
        }
      }
    }
}

struct CustomView<T: View>: View {
  
  var content: T
  
  var body: some View {
    content
  }
}

struct CustomModel<T> {
  var data: T?
  
  init(data: T? = nil) {
    self.data = data
  }
  
  mutating func removeData() {
    self.data = nil
  }
}

#Preview {
  GenericsBootcamp()
}
