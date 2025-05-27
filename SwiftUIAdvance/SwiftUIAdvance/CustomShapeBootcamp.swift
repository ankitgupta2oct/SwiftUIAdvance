//

import SwiftUI

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: CGPoint(x: rect.midX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
      path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    }
  }
}

struct CustomShapeBootcamp: View {
    var body: some View {
      Triangle()
        .fill(.brown)
        .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomShapeBootcamp()
}
