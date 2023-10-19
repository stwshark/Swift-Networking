import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Image("Nasa")
                        .resizable()
                        .frame(width: 80,height: 80)
                    Text("NASA Astronomy Picture of the Day")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Spacer()
                }
                VStack{
                    NavigationLink(destination: ApodView()) {
                        NavigationButton(buttonCaption: "See Today's APOD")
                    }
                    NavigationLink(destination: NewsView()) {
                        NavigationButton(buttonCaption: "News")
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background{RoundedRectangle(cornerRadius: 20)
                        .fill(Color("NasaBlue"))
                }
                Spacer()
            }
        }
        .accentColor(Color("NasaBlue"))
        .padding()
    }
}


struct NavigationButton: View {
    let buttonCaption: String
    var body: some View {
        HStack{
            Text("\(buttonCaption)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(.black))
            Spacer()
            Text(">")
                .font(.system(size: 18, weight: .bold, design: .rounded))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
        }
        .shadow(radius: 10)
    }
}

#Preview {
    ContentView()
}
