import SwiftUI

struct CustomNavigationView<Content: View>: View {
  var content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    NavigationView {
      CustomNavbarContainerView {
        content
      }
    }
  }
}

extension View {
  func customNativationTittle(_ tittle: String) -> some View {
    preference(key: CustomNavbarTittlePreferenceKey.self, value: tittle)
  }
  
  func customNativationSubtiitle(_ subtittle: String) -> some View {
    preference(key: CustomNavbarSubtitlePreferenceKey.self, value: subtittle)
  }
  
  func customNativationBackButtonHidden(_ hidden: Bool) -> some View {
    preference(key: CustomNavbarBackButtonHiddenPreferenceKey.self, value: hidden)
  }
}

extension UINavigationController {
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    interactivePopGestureRecognizer?.delegate = nil
  }
}

#Preview {
  CustomNavigationView {
    ZStack {
      Color.red
    }
  }
}
