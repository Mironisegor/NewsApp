//
//  ContentView.swift
//  Schedule
//
//  Created by Mironov Egor production on 01.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView() {
            ScrollView(.vertical, showsIndicators: false) {
                Text("News")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.topNews, id: \.url) { article in
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
