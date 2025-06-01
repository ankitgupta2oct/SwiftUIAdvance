import SwiftUI

struct CustomCircle: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.addArc(
        center: CGPoint(x: rect.midX, y: rect.midY),
        radius: rect.width / 2,
        startAngle: .zero,
        endAngle: .degrees(360),
        clockwise: false)
    }
  }
}

struct HalfCapsule: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.minX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
      
      path.addArc(
        center: CGPoint(x: rect.midX, y: rect.midY),
        radius: rect.height / 2,
        startAngle: .degrees(-90),
        endAngle: .degrees(180),
        clockwise: false)
      
      path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
    }
  }
}

struct CustomCurveBootcamp: View {
    var body: some View {
      HalfCapsule()
        .frame(width: 100, height: 100)
    }
}

#Preview {
    CustomCurveBootcamp()
}
