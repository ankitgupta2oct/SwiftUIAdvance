import SwiftUI

struct ViewBuilderBootcamp: View {
    var body: some View {
      ViewBuilderCustomView {
        Image(systemName: "heart.fill")
      }
      
      ViewBuilderCustomView2(number: 4)
    }
}

struct ViewBuilderCustomView<T: View>: View {
  let content: T
  
  init(@ViewBuilder content: () -> T) {
    self.content = content()
  }
  
  var body: some View {
    VStack {
      Text("Hello")
      content
    }
  }
}

struct ViewBuilderCustomView2: View {
  let number: Int
  var body: some View {
    myView
  }
  
  @ViewBuilder private var myView: some View {
    if(number % 2 == 0) {
      Text("Hello Custom View")
    } else {
      Button("Click") {
        
      }
    }
  }
}



#Preview {
    ViewBuilderBootcamp()
}
