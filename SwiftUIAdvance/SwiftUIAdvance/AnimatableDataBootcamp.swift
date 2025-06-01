import SwiftUI

struct AnimatableDataBootcamp: View {
  @State var canAnimate = false
  var body: some View {
    ZStack {
      RectangleWithSingleSideAnimation(cornerRadius: canAnimate ? 60 : 0)
        .frame(width: 300, height: 300)
    }
    .onAppear {
      withAnimation(.smooth.repeatForever()) {
        canAnimate = true
      }
    }
  }
}

struct RectangleWithSingleSideAnimation: Shape {
  var cornerRadius: CGFloat
  
  var animatableData: CGFloat {
    get { cornerRadius }
    set { cornerRadius = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addLine(to: .init(x: rect.maxX, y: rect.minY))
      path.addLine(to: .init(x: rect.maxX, y: rect.maxY - cornerRadius))
      path.addArc(center: .init(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                  radius: cornerRadius,
                  startAngle: .zero,
                  endAngle: .degrees(360),
                  clockwise: false)
      path.addLine(to: .init(x: rect.maxX - cornerRadius, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX, y: rect.maxY))
    }
  }
}

#Preview {
  AnimatableDataBootcamp()
}
