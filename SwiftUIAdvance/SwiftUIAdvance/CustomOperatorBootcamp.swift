import SwiftUI

struct CustomOperatorBootcamp: View {
    var body: some View {
      Text("Hello, World!")
        .onAppear {
          let value = 10 +/ 20
          print(value)
        }
    }
}

infix operator +/

extension FloatingPoint {
    static func +/(lhs: Self, rhs: Self) -> Self {
        return (lhs + rhs) / 2
    }
}


#Preview {
    CustomOperatorBootcamp()
}
