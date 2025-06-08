import SwiftUI

struct AppNavbarView: View {
    var body: some View {
      customNavBar
    }
}

// MARK: Custom Navbar

extension AppNavbarView {
  private var customNavBar: some View {
    CustomNavigationView {
      VStack {
        Text("Hello, World!")
        
        CustomNavigationLink {
          Text("Next Page Hello")
            .customNativationTittle("Temp Tittle2")
            .customNativationSubtiitle("Temp SubTittle2")
            .customNativationBackButtonHidden(false)
        } label: {
          Text("Go to next page")
        }
      }
      .customNativationTittle("Temp Tittle")
      .customNativationSubtiitle("Temp SubTittle")
      .customNativationBackButtonHidden(true)
    }
  }
}

// MARK: Native NavBar

extension AppNavbarView {
  private var nativeNavBar: some View {
    NavigationView {
      VStack {
        Text("Hello, World!")
          
        NavigationLink {
          Text("Next Page Hello")
            .navigationTitle("Next Page")
        } label: {
          Text("Go to next page")
        }
      }
      .navigationTitle("Main Page")
    }
  }
}

#Preview {
    AppNavbarView()
}
