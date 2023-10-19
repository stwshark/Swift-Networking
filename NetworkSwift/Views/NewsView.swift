import SwiftUI

struct NewsView: View {
    @ObservedObject private var viewModel = NewsViewModel()
    var body: some View {
        ScrollView {
            if let news = viewModel.newsResponse {
                ForEach(news.articles, id: \.self) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        VStack(spacing: 15) {
                            WebImageView(imageUrl: article.urlToImage ?? "")
                            VStack(alignment: .leading, spacing: 10) {
                                Text(article.title)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .multilineTextAlignment(.leading)
                                HStack {
                                    Text("SOURCE:")
                                        .fontDesign(.monospaced)
                                    Spacer()
                                    Text(article.source.name ?? "")
                                        .fontDesign(.monospaced)
                                }
                            }.frame(maxWidth:.infinity)
                        }
                        .accentColor(Color.black)
                        .padding()
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        }
                        .shadow(radius: 2)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 5)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .clipped()
        .navigationBarTitle("News", displayMode: .inline)
        .onAppear(perform: viewModel.GetNews)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack {
                WebImageView(imageUrl: article.urlToImage ?? "")
                VStack(alignment: .leading) {
                    Text(article.author ?? "")
                        .font(.system(size: 22, weight: .bold, design: .default))
                    Text(article.source.name ?? "")
                        .font(.system(size: 20, weight: .regular, design: .monospaced))
                    if let articleURl = article.url {
                        Link("Read Full Topic In Browser", destination: URL(string: articleURl)!)
                            .foregroundColor(Color("NasaBlue"))
                            .padding(.top, 5)
                    }
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.bottom, 20)
                VStack(alignment: .leading, spacing: 20) {
                    Text(article.description ?? "")
                    Text(article.content ?? "")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("NasaBlue"))
                }
            }
        }
        .navigationBarTitle(article.source.name ?? "")
        .frame(maxWidth: .infinity)
        .padding()
    }
}


#Preview {
    NewsView()
}
