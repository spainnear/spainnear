


import SwiftUI

struct DetailView: View {
  let sculptureWork: SculptureWork
  @State private var showMap = false

    var body: some View {
        VStack {
            Image(sculptureWork.imageName)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 600)
                .aspectRatio(contentMode: .fit)
            Text("\(sculptureWork.reaction)  \(sculptureWork.title)")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            HStack {
                Button(action: { self.showMap = true }) {
                    Image(systemName: "mappin.and.ellipse")
                }
                .sheet(isPresented: $showMap) {
                    //          MapView(coordinate: self.artwork.coordinate)
                    LocationMap(showModal: self.$showMap, sculpturWork: self.sculptureWork)
                }
                Text(sculptureWork.locationName)
                    .font(.subheadline)
            }
            Text("Artist: \(sculptureWork.artist)")
                .font(.subheadline)
            Divider()
            Text(sculptureWork.description)
                .multilineTextAlignment(.leading)
                .lineLimit(20)
        }
        .padding()
        .navigationBarTitle(Text(sculptureWork.title), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      DetailView(sculptureWork: sculptureData[0])
    }
}
