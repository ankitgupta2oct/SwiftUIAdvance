//

import SwiftUI

struct ScrollAnimationPrefrenceKeyBootcamp: View {
  @State var tittleSize: CGFloat = .zero
  
    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          tittleView
            .opacity(tittleSize / 78 )
            .background {
              GeometryReader { geo in
                Text("")
                  .preference(key: ScrollAnimationPrefrenceKey.self, value: geo.frame(in: .global).minY)
              }
            }
            .onPreferenceChange(ScrollAnimationPrefrenceKey.self) { size in
              tittleSize = size
              print("\(tittleSize) : \(tittleSize)")
            }
          
          content
        }
      }
      .padding(.horizontal)
    }
  
  private var tittleView: some View {
    Text("This is main Tittle")
      .font(.largeTitle)
      .bold()
  }
  
  private var content: some View {
    ForEach(0..<30) { _ in
      Rectangle()
        .frame(width: .infinity, height: 300)
    }
  }
}

struct ScrollAnimationPrefrenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}

#Preview {
    ScrollAnimationPrefrenceKeyBootcamp()
}
