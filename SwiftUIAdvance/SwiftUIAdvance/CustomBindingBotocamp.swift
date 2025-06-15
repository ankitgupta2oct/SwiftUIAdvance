import SwiftUI

struct CustomBindingBotocamp: View {
  @State var alertMessage: String? = nil
    var body: some View {
      VStack {
        Button("Click") {
          alertMessage = "My Alert"
        }
      }
      .alert("Alert", isPresented: Binding(value: $alertMessage)) {
        
      }
    }
}

extension Binding where Value == Bool {
  init<T>(value: Binding<T?>) {
    self.init {
      value.wrappedValue != nil
    } set: { newValue in
      if !newValue {
        value.wrappedValue = nil
      }
    }
  }
}

#Preview {
    CustomBindingBotocamp()
}
