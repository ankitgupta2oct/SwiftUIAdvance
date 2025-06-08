import SwiftUI

struct CustomNavbarContainerView<Content: View>: View {
  @State var title: String = ""
  @State var subtitle: String?
  @State var barBackButtonHidden: Bool = false
  
  var content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
    var body: some View {
      VStack(spacing: 0) {
        CustomNavbarView(title: title, subtitle: subtitle, barBackButtonHidden: barBackButtonHidden)
        
        content
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      .onPreferenceChange(CustomNavbarTittlePreferenceKey.self, perform: {
        title = $0
      })
      .onPreferenceChange(CustomNavbarSubtitlePreferenceKey.self, perform: { subtitle = $0 })
      .onPreferenceChange(CustomNavbarBackButtonHiddenPreferenceKey.self, perform: { barBackButtonHidden = $0 })
      .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
  CustomNavbarContainerView {
    ZStack {
      Color.black
      
      Text("Empty Data")
        .font(.largeTitle)
        .foregroundStyle(.white)
    }
    .customNativationTittle("Custom tittle")
    .customNativationSubtiitle("Custom Sub tittle")
    .customNativationBackButtonHidden(false)
  }
}
