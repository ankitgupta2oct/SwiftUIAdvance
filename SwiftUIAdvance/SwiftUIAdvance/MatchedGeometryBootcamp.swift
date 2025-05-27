//

import SwiftUI

struct MatchedGeometryBootcamp: View {
  @State var selectedItem = ""
  @Namespace var namespace
  let items = ["Home", "Order", "Profile"]
    var body: some View {
      VStack {
        Spacer()
        
        HStack {
          ForEach(items, id: \.self) { item in
            ZStack {
              if(selectedItem == item) {
                RoundedRectangle(cornerRadius: 10)
                  .fill(.orange.opacity(0.7))
                  .matchedGeometryEffect(id: "selected_item", in: namespace)
              }
              
              Text(item)
                .bold()
                .foregroundStyle(selectedItem == item ? .white : .primary)
            }
            .frame(maxWidth: .infinity, maxHeight: 70)
            .onTapGesture {
              withAnimation(.spring.speed(2)) {
                selectedItem = item
              }
            }
          }
        }
        .padding()
      }
    }
}

#Preview {
    MatchedGeometryBootcamp()
}
