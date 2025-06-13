import SwiftUI

struct TimelineViewBootcamp: View {
  @State var date: Date = .now
  @State var isPaused: Bool = false
  
    var body: some View {
      VStack {
        TimelineView(.animation(minimumInterval: 1, paused: isPaused)) { context in
          let interval = context.date.timeIntervalSince(date)
          
          Text("\(interval)")
          Rectangle()
            .frame(width: 100, height: 100)
            .animation(.bouncy, value: interval)
            .rotationEffect(.degrees(interval))
          
        }
        Button("Pause") {
          isPaused.toggle()
        }
      }
    }
}

#Preview {
    TimelineViewBootcamp()
}
