import SwiftUI

struct CustomTabView<Content: View>: View {
  @Binding var selection: TabBarItem?
  var content: Content
  
  @State private var items: [TabBarItem] = []
  
  init(selection: Binding<TabBarItem?>, @ViewBuilder content: () -> Content) {
    _selection = selection
    self.content = content()
  }
    
  var body: some View {
    VStack {
      ZStack {
        content
      }
      
      CustomTabBarView2(selectedTabItem: $selection, items: items)
    }
    .onPreferenceChange(CustomTabPrefrenceKey.self) {
      items = $0
    }
  }
}
