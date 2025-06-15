import SwiftUI

struct CustomErrorAndAlertBootcamp: View {
  @State var alert: FetchRequestAlert?
  var body: some View {
    ZStack {
      Button("Fetch Data", action: fetcData)
    }
    .showAlert(alert: $alert)
  }
  
  private func fetcData() {
    let success = false
    
    if !success {
      alert = .serverError
    }
  }
}

protocol MyErrorAlert: Error, LocalizedError {
  var tittle: String { get }
  var subTittle: String? { get }
}

extension View {
  func showAlert<T: MyErrorAlert>(alert: Binding<T?>) -> some View {
    self
      .alert(alert.wrappedValue?.tittle ?? "Alert", isPresented: Binding(value: alert)) {
        Button("Ok") {
          
        }
      } message: {
        if let message = alert.wrappedValue?.subTittle {
          Text(message)
        }
      }
  }
}

enum FetchRequestAlert: MyErrorAlert {
  case noDataFound
  case serverError
  
  var errorDescription: String? {
    switch self {
      
    case .noDataFound: "No Data Found"
    case .serverError: "Server is not responding"
    @unknown default: "Somting went wrong"
    }
  }
  
  var tittle: String {
    switch self {
      
    case .noDataFound: "No Data Found"
    case .serverError: "Server Error"
    }
  }
  
  var subTittle: String? {
    switch self {
      
    case .noDataFound: nil
    case .serverError: errorDescription
    }
  }
}


#Preview {
    CustomErrorAndAlertBootcamp()
}
