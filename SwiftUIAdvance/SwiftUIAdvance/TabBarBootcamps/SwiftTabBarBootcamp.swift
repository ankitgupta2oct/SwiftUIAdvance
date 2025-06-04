//

import SwiftUI

struct SwiftTabBarBootcamp: View {
    var body: some View {
      // MARK: New TabView
//      TabView {
//        
//        Tab("Home", systemImage: "house") {
//          Color.red
//        }
//        
//        Tab("Order", systemImage: "dollarsign") {
//          Color.green
//        }
//        
//        Tab("Profile", systemImage: "person") {
//          Color.blue
//        }
//      }
      
      // MARK: Old TabView
      
      TabView {
        Color.red
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        
        Color.green
          .tabItem {
            Image(systemName: "dollarsign")
            Text("Order")
          }
        
        Color.blue
          .tabItem {
            Image(systemName: "person")
            Text("Profile")
          }
      }
    }
}

#Preview {
    SwiftTabBarBootcamp()
}
