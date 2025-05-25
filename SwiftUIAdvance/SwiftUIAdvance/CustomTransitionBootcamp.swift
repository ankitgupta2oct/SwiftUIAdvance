import SwiftUI

struct RorationViewModofier : ViewModifier {
  let degrees: Double
  
  init(degree: Double = 0) {
    self.degrees = degree
  }
  
  func body(content: Content) -> some View {
    content
      .rotationEffect(.degrees(degrees))
      .opacity(degrees != .zero ? 1.0 : 0)
  }
}

extension AnyTransition {
  static var rotating: AnyTransition {
    AnyTransition.modifier(
      active: RorationViewModofier(),
      identity: RorationViewModofier(degree: 180))
  }
  
  static func rotating(degree: Double) -> AnyTransition {
    AnyTransition.modifier(
      active: RorationViewModofier(),
      identity: RorationViewModofier(degree: degree))
  }
  
  static var rotateAndOut: AnyTransition {
    AnyTransition.asymmetric(
      insertion: rotating,
      removal: .move(edge: .trailing))
  }
}

struct CustomTransitionBootcamp: View {
  @State var showView = false
    var body: some View {
      VStack {
        Spacer()
        if showView {
          RoundedRectangle(cornerRadius: 10)
            .frame(width: 200, height: 300)
            .frame(maxWidth: .infinity)
//            .transition(.rotating)
//            .transition(.rotating(degree: 360))
            .transition(.rotateAndOut)
        }
        Spacer()
        
        Button("Perform") {
          withAnimation(.easeOut) {
            showView.toggle()
          }
        }
      }
    }
}

#Preview {
    CustomTransitionBootcamp()
}
