import SwiftUI

struct UIViewRepresentableBootcamp: View {
  
  @State var text = ""
  
    var body: some View {
      VStack(spacing: 50) {
        Text(text)
        
        HStack {
          Text("SwiftUI: ")
          TextField("Type Here", text: $text)
            .background(.gray)
        }
        
        HStack {
          Text("UIKit: ")
          UITextFieldViewRepresentable(text: $text)
            .frame(maxHeight: 40)
            .background(.orange.opacity(0.3))
        }
      }
      .padding()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
  
  @Binding var text: String
  let placeholder: String
  let placeholderColor: UIColor
  
  init(text: Binding<String>, placeholder: String = "Default text...", placeholderColor: UIColor = .blue) {
    self._text = text
    self.placeholder = placeholder
    self.placeholderColor = placeholderColor
  }
  
  func makeUIView(context: Context) -> UITextField {
    let textField = UITextField(frame: .zero)
    let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
      .foregroundColor : placeholderColor
    ])
    textField.attributedPlaceholder = attributedPlaceholder
    textField.delegate = context.coordinator
    return textField
  }
  
  // SWiftUI to UIKit
  func updateUIView(_ uiView: UITextField, context: Context) {
    uiView.text = text
  }
  
  // UIKit to SwiftUI
  
  func makeCoordinator() -> UITextFieldCoodinator {
    UITextFieldCoodinator(text: $text)
  }
  
  class UITextFieldCoodinator: NSObject, UITextFieldDelegate {
    @Binding var text: String
    
    init(text: Binding<String>) {
      self._text = text
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
      text = textField.text ?? ""
    }
  }
}

#Preview {
    UIViewRepresentableBootcamp()
}
