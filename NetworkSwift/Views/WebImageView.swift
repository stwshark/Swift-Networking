import SwiftUI

struct WebImageView: View {
    let imageUrl: String
    var body: some View {
        AsyncImage(url: URL(string: "\(imageUrl)")){ phase in
            switch phase {
            case .empty:
                Image("Nasa")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                Text("Getting Image...")
                    .font(.system(.callout, design: .monospaced, weight: .bold))
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(10)
            case .failure:
                Image(systemName: "Nasa")
                    .frame(width: 150, height: 150)
                    .scaledToFit()
            @unknown default:
                Image("Nasa")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                Text("No IMAGE!")
                    .font(.system(.callout, design: .monospaced, weight: .bold))
            }
        }
        .scaledToFit()
        .frame(maxWidth: .infinity, maxHeight: 200)
        .clipped()
        .cornerRadius(10)
    }
}

#Preview {
    WebImageView(imageUrl: "")
}
