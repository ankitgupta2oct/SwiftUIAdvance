import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
  @State var image: UIImage?
  @State var showImagePicker: Bool = false
  
  var body: some View {
    VStack {
      if let image = image {
        Image(uiImage: image)
          .resizable()
          .frame(width: 200, height: 200)
      }
      
      Button("Select Picker") {
        showImagePicker.toggle()
      }
    }
    .sheet(isPresented: $showImagePicker) {
      UIImagePickerControllerRepresntable(image: $image, showImagePicker: $showImagePicker)
    }
  }
}

struct UIImagePickerControllerRepresntable: UIViewControllerRepresentable {
  @Binding var image: UIImage?
  @Binding var showImagePicker: Bool
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
  
  func makeCoordinator() -> ImagePickerCoodinator {
    ImagePickerCoodinator(image: $image, showImagePicker: $showImagePicker)
  }
  
  class ImagePickerCoodinator: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool
    
    init(image: Binding<UIImage?>, showImagePicker: Binding<Bool>) {
      self._image = image
      self._showImagePicker = showImagePicker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      guard let newImage = info[.originalImage] as? UIImage else { return }
      
      showImagePicker = false
      image = newImage
    }
  }
}

#Preview {
    UIViewControllerRepresentableBootcamp()
}
