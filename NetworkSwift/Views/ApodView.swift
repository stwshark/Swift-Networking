import SwiftUI

struct ApodView: View {
    @StateObject private var vm = ApodViewModel()
    var body: some View {
        VStack{
            if let apod = vm.apod {
                ScrollView(showsIndicators: false){
                    Text("\(apod.title)")
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                    VStack(alignment: .leading) {
                        ApodImage(imageUrl: apod.hdurl != nil ? apod.hdurl! : apod.url)
                        Text("\(apod.date)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                        Text("\(apod.mediaType)")
                        Text("\(apod.serviceVersion)")
                    }.padding()
                    Spacer()
                    VStack {
                        Text("\(apod.explanation)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("NasaBlue"))
                    }
                }
                .padding()
                .padding(.top, 40)
                .edgesIgnoringSafeArea(.all)
            } else {
                Image("Nasa")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                Text("Proccesing to get data...")
                    .font(.system(.callout, design: .monospaced, weight: .bold))
            }
        }.onAppear(perform: vm.GetApod)
    }
}

struct ApodImage: View {
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
                    .frame(maxWidth: 300, maxHeight: 300)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            case .failure:
                Image(systemName: "Nasa")
                    .frame(width: 150, height: 150)
                    .scaledToFit()
            @unknown default:
                EmptyView()
                    .frame(width: 150, height: 150)
            }
        }
        .scaledToFill()
        .frame(width: 300, height: 300)
        .clipped()
        .cornerRadius(10)
    }
}

#Preview {
    ApodView()
}
