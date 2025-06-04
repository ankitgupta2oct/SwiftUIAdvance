import SwiftUI

struct CustomTabBarView1: View {
  @Binding var selectedTabItem: TabBarItem?
  let items: [TabBarItem]
    
  var body: some View {
    HStack {
      ForEach(items, id: \.self) { item in
        CustumTabItem1(tabItem: item)
          .onTapGesture {
            withAnimation(.easeInOut) {
              selectedTabItem = item
            }
          }
      }
    }
  }
}

struct CustomTabBarView2: View {
  @Binding var selectedTabItem: TabBarItem?
  let items: [TabBarItem]
  @Namespace var namespace
    
  var body: some View {
    HStack {
      ForEach(items, id: \.self) { item in
        CustumTabItem2(tabItem: item)
          .onTapGesture {
            withAnimation(.easeInOut) {
              selectedTabItem = item
            }
          }
      }
    }
    .background {
      RoundedRectangle(cornerRadius: 10)
        .fill(.white)
        .shadow(radius: 10)
    }
    .padding()
  }
}

extension CustomTabBarView1 {
  
  func CustumTabItem1(tabItem: TabBarItem) -> some View {
    VStack {
      Image(systemName: tabItem.systemIcon)
      Text(tabItem.title)
    }
    .foregroundStyle(selectedTabItem == tabItem ? tabItem.color : .primary)
    .padding()
    .frame(maxWidth: .infinity)
    .background{
      tabItem.color.opacity(selectedTabItem == tabItem ? 0.2 : 0.0)
        .clipShape(.rect(cornerRadius: 10))
    }
  }
}

extension CustomTabBarView2 {
  
  func CustumTabItem2(tabItem: TabBarItem) -> some View {
    VStack {
      Image(systemName: tabItem.systemIcon)
      Text(tabItem.title)
    }
    .foregroundStyle(selectedTabItem == tabItem ? tabItem.color : .primary)
    .padding()
    .frame(maxWidth: .infinity)
    .background{
      if(selectedTabItem == tabItem) {
        RoundedRectangle(cornerRadius: 10)
          .fill(tabItem.color.opacity(selectedTabItem == tabItem ? 0.2 : 0.0))
          .padding(5)
          .matchedGeometryEffect(id: "tab_background", in: namespace)
      }
    }
  }
}
