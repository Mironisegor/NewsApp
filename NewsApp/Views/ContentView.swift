import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Top News")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                        ForEach(vm.topNews, id: \.url) { article in
                            CellOfTopNews(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 5)
                
                Text("Other News")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 20) {
                        ForEach(vm.otherNews, id: \.url) { article in
                            CellOfOtherNews(article: article)
                        }
                    }
                    .padding(.horizontal)
                }
                .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 5)
            }
            .background(.secondary.opacity(0.2))
            .refreshable {
                vm.fetchOtherNews()
                vm.fetchTopNews()
            }
        }
    }
}

#Preview {
    ContentView()
}
