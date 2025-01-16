

import SwiftUI

struct LocationMap: View {
  @Binding var showModal: Bool
  var sculpturWork: SculptureWork

  var body: some View {
    VStack {
      MapView(coordinate: sculpturWork.coordinate)
      HStack {
        Text(self.sculpturWork.locationName)
        Spacer()
        Button("Done") { self.showModal = false }
      }
      .padding()
    }
  }
}

struct LocationMap_Previews: PreviewProvider {
  static var previews: some View {
    LocationMap(showModal: .constant(true), sculpturWork: sculptureData[0])
  }
}
