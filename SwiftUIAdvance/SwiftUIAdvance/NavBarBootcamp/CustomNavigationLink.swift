import SwiftUI

struct CustomNavigationLink<Label: View, Destination: View>: View {
  var label: Label
  var destination: Destination
  
  init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
    self.destination = destination()
    self.label = label()
  }
  
  var body: some View {
    NavigationLink {
      CustomNavbarContainerView {
        destination
      }
      .navigationBarBackButtonHidden()
      .navigationTitle("")
    } label: {
      label
    }
  }
}

#Preview {
  CustomNavigationView {
    CustomNavigationLink {
      Text("Next View")
    } label: {
      Text("Go to next View")
    }
  }
}
