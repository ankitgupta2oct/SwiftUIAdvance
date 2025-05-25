//

import SwiftUI

struct PressingButtonStyle : ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .opacity(configuration.isPressed ? 0.8 : 1.0)
      .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
      .animation(.smooth, value: configuration.isPressed)
  }
}

extension ButtonStyle where Self == PressingButtonStyle {
    static var pressing: PressingButtonStyle { PressingButtonStyle() }
}

struct CustomButtonStyleBootcamp: View {
    var body: some View {
      Button {
        
      } label: {
        Text("Click Me")
          .capsuleViewStyle()
      }
      .buttonStyle(.pressing)
      .foregroundStyle(.white)
      .padding()
    }
}

#Preview {
    CustomButtonStyleBootcamp()
}
