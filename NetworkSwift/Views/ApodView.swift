import SwiftUI

struct ApodView: View {
    @StateObject private var vm = ApodViewModel()
    var body: some View {
        VStack{
            if let apod = vm.apod {
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading) {
                        WebImageView(imageUrl: apod.hdurl != nil ? apod.hdurl! : apod.url)
                        Text("\(apod.title)")
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                        Text("\(apod.date)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                        Text("\(apod.mediaType)")
                        Text("\(apod.serviceVersion)")
                    }
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
        }
        .navigationBarTitle("APOD", displayMode: .inline)
        .onAppear(perform: vm.GetApod)
    }
}



#Preview {
    ApodView()
}
