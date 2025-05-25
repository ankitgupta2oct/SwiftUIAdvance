import SwiftUI

struct CapsuleViewModofier: ViewModifier {
  let backgroundColor: Color
  
  func body(content: Content) -> some View {
    content.font(.title)
      .frame(maxWidth: .infinity)
      .frame(height: 50)
      .background(backgroundColor)
      .clipShape(.capsule)
  }
}

struct ViewModofierBotocamp: View {
  var body: some View {
    VStack {
      Text("Hello World")
        .capsuleViewStyle()
      
      Text("Hello, World")
        .capsuleViewStyle(backgroundColor: .green)
      
      Text("Hello World!")
        .capsuleViewStyle(backgroundColor: .blue)
    }
    .padding()
  }
}

extension View {
  func capsuleViewStyle(backgroundColor: Color = .red) -> some View {
    modifier(CapsuleViewModofier(backgroundColor: backgroundColor))
  }
}

#Preview {
    ViewModofierBotocamp()
}
