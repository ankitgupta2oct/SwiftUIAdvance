import SwiftUI

struct Employee: Identifiable {
  let id: UUID
  let name: String
}

extension Array where Element == Employee {
  subscript(id: UUID) -> Element? {
    first(where: {$0.id == id})
  }
}

struct SubscirptBootcamp: View {
  let empArray = [
    Employee(id: UUID(), name: "Ankit1"),
    Employee(id: UUID(), name: "Ankit2"),
    Employee(id: UUID(), name: "Ankit3"),
  ]
  @State var selectedEmployee: Employee?
  
    var body: some View {
      VStack {
        Text("Seleted: \(selectedEmployee?.name ?? "No name")")
        List {
          ForEach(empArray) { emp in
            Text("Emp \(emp.name) : \(emp.id)")
              .onTapGesture {
                selectedEmployee = empArray[emp.id]
              }
          }
        }
      }
    }
}

#Preview {
    SubscirptBootcamp()
}
