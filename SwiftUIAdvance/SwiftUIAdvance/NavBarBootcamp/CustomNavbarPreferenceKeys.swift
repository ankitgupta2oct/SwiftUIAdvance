import Foundation
import SwiftUI

struct CustomNavbarTittlePreferenceKey : PreferenceKey {
  static var defaultValue: String = ""
  
  static func reduce(value: inout String, nextValue: () -> String) {
    value = nextValue()
  }
}

struct CustomNavbarSubtitlePreferenceKey : PreferenceKey {
  static var defaultValue: String? = ""
  
  static func reduce(value: inout String?, nextValue: () -> String?) {
    value = nextValue()
  }
}

struct CustomNavbarBackButtonHiddenPreferenceKey : PreferenceKey {
  static var defaultValue: Bool = false
  
  static func reduce(value: inout Bool, nextValue: () -> Bool) {
    value = nextValue()
  }
}
