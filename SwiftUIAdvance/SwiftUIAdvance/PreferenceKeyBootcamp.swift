//

import SwiftUI

struct PreferenceKeyBootcamp: View {
  @State var customTitle = "Hello!!!"
  var body: some View {
    VStack {
      Text(customTitle)
      CustomPreferenceKeyView()
    }
    .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
      customTitle = value
    }
  }
}

extension View {
  func customTitle(_ title: String) -> some View {
    preference(key: CustomTitlePreferenceKey.self, value: title)
  }
}

struct CustomTitlePreferenceKey: PreferenceKey {
  static var defaultValue: String = ""
  
  static func reduce(value: inout String, nextValue: () -> String) {
    value = nextValue()
  }
}



struct CustomPreferenceKeyView: View {
  @State var title = ""
  var body: some View {
    Button("Click to set custom tittle") {
      title = "My Custom tittle"
    }
    .customTitle(title)
  }
}

#Preview {
    PreferenceKeyBootcamp()
}
