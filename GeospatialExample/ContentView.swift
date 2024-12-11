import SwiftUI
struct ContentView: View {
  @StateObject var manager = GeospatialManager()

  private let font = Font.system(size: 14)
  private let boldFont = Font.system(size: 14, weight: .bold)
  private let anchorTypes: [(GeospatialManager.AnchorType, String)] = [
    (.geospatial, "Geospatial"),
    (.terrain, "Terrain"),
    (.rooftop, "Rooftop"),
  ]

  var body: some View {
    ZStack {
      ARViewContainer(manager: manager)
        .ignoresSafeArea()
        .onTapGesture {
          manager.tapPoint($0)
        }
      VStack {
        ZStack(alignment: .leading) {
          Rectangle()
            .opacity(0.5)
          Text(manager.trackingLabel)
            .font(font)
            .foregroundStyle(.white)
            .lineLimit(6)
            .multilineTextAlignment(.leading)
        }
        .frame(height: 140)
        Spacer()
        if manager.tapScreenVisible {
          Text("TAP ON SCREEN TO CREATE ANCHOR")
            .font(boldFont)
            .foregroundStyle(.white)
        }
        ZStack(alignment: .leading) {
          Rectangle()
            .opacity(0.5)
          Text(manager.statusLabel)
            .font(font)
            .foregroundStyle(.white)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
          if manager.clearAnchorsVisible {
            VStack {
              Spacer()
              Button {
                manager.clearAllAnchors()
              } label: {
                Text("CLEAR ALL ANCHORS")
                  .font(boldFont)
              }
            }
          }
          VStack {
            Spacer()
            Toggle(isOn: $manager.streetscapeGeometryEnabled) {
              Text("SHOW GEOMETRY")
                .font(boldFont)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
          }
          if manager.anchorModeVisible {
            VStack {
              HStack {
                Spacer()
                Menu {
                  Picker(selection: $manager.anchorType) {
                    ForEach(anchorTypes, id: \.self.0) { type in
                      Text(type.1)
                    }
                  } label: {
                  }
                } label: {
                  HStack(spacing: 0) {
                    Image(uiImage: UIImage(systemName: "gearshape.fill")!)
                      .renderingMode(.template)
                      .foregroundStyle(.blue)
                    Text("ANCHOR SETTINGS")
                      .font(boldFont)
                  }
                }
              }
              Spacer()
            }
          }
        }
        .frame(height: 160)
      }
    }
    .alert("AR in the real world", isPresented: $manager.showPrivacyNotice) {
      Button {
        manager.acceptPrivacyNotice()
      } label: {
        Text("Get started")
      }
      Link("Learn more", destination: URL(string: "https://developers.google.com/ar/data-privacy")!)
    } message: {
      Text("To power this session, Google will process visual data from your camera.")
    }
    .alert("VPS not available", isPresented: $manager.showVPSUnavailableNotice) {
      Button {
      } label: {
        Text("Continue")
      }
    } message: {
      Text(
        "The Google Visual Positioning Service (VPS) is not available at your current "
          + "location. Location data may not be as accurate.")
    }
  }
}

#Preview {
  ContentView()
}
