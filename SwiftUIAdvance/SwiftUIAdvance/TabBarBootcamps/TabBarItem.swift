import SwiftUI

enum TabBarItem: Hashable {
  
  case home, order, profile
  
  var title: String {
    switch self {
    case .home: "Home"
    case .order: "Order"
    case .profile: "Profile"
    }
  }
  
  var systemIcon: String {
    switch self {
    case .home: "house"
    case .order: "dollarsign"
    case .profile: "person"
    }
  }
  
  var color: Color {
    switch self {
    case .home: .red
    case .order: .green
    case .profile: .blue
    }
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
    hasher.combine(systemIcon)
  }
}
