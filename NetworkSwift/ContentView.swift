import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Image("Nasa")
                    .resizable()
                    .frame(width: 100,height: 100)
                Text("NASA Astronomy Picture of the Day")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                Spacer()
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
}
