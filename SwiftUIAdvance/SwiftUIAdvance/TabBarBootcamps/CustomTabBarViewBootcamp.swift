//

import SwiftUI

struct CustomTabBarViewBootcamp: View {
  
  @State var selection: TabBarItem?
    
  var body: some View {
    CustomTabView(selection: $selection) {
      Color.red
        .tabBarItem(tabItem: .home, selection: $selection)
      
      Color.green
        .tabBarItem(tabItem: .order, selection: $selection)
      
      Color.blue
        .tabBarItem(tabItem: .profile, selection: $selection)
    }
  }
}

#Preview {
    CustomTabBarViewBootcamp()
}
