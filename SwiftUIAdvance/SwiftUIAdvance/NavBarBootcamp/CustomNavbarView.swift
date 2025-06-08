import SwiftUI

struct CustomNavbarView: View {
  
  @Environment(\.dismiss) private var dismiss
  
  let title: String
  let subtitle: String?
  let barBackButtonHidden: Bool
  
  var body: some View {
    HStack {
      if !barBackButtonHidden {
        backButton
      }
      Spacer()
      tittleView
      Spacer()
      if !barBackButtonHidden {
        backButton
          .opacity(0)
      }
    }
    .foregroundStyle(.primary)
    .padding()
    .background(.orange.opacity(0.7))
  }
}

extension CustomNavbarView {
  private var backButton: some View {
    Button("", systemImage: "chevron.left") {
      dismiss()
    }
    .font(.largeTitle)
    .bold()
  }
  
  private var tittleView: some View {
    VStack {
      Text(title)
        .bold()
        .font(.title)
      if let subtitle = subtitle {
        Text(subtitle)
          .font(.title2)
      }
    }
  }
}

#Preview {
    CustomNavbarView(title: "My Tittle", subtitle: "My Subtitle", barBackButtonHidden: false)
}
