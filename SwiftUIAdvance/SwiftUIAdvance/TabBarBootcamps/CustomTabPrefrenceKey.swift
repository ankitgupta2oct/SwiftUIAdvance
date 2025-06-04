import Foundation
import SwiftUI

struct CustomTabPrefrenceKey: PreferenceKey {
  
  static var defaultValue: [TabBarItem] = []
  
  static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
    value += nextValue()
  }
}

struct CustomTabBarViewModofier: ViewModifier {
  
  let tabItem: TabBarItem
  @Binding var selection: TabBarItem?
  
  func body(content: Content) -> some View {
    content
      .opacity(selection == tabItem ? 1 : 0)
      .preference(key: CustomTabPrefrenceKey.self, value: [tabItem])
  }
}

extension View {
  
  func tabBarItem(tabItem: TabBarItem, selection: Binding<TabBarItem?>) -> some View {
    modifier(CustomTabBarViewModofier(tabItem: tabItem, selection: selection))
  }
}
