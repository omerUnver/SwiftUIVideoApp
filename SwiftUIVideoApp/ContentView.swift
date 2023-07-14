//
//  ContentView.swift
//  SwiftUIVideoApp
//
//  Created by M.Ömer Ünver on 7.07.2023.
//
import AVKit
import SwiftUI
import SDWebImageSwiftUI
import SDWebImage
struct ContentView: View {
    @State private var gridItems: [GridItem] = [GridItem(.adaptive(minimum: 120), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(videoData, id: \.id) { value in
                        NavigationLink {
                            VideoDetailView(video: value)
                        } label: {
                            VStack {
                                WebImage(url: value.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 100)
                                Text(value.title)
                                    .font(.headline)
                                    .lineLimit(3)
                                    .padding(.horizontal, 8)
                                    .foregroundColor(.orange)
                            }
                            .frame(maxWidth: .infinity)
                            
                            
                        }
                    }
                }
                 
            }
            .padding(.top)
            .navigationTitle(Text("Videos"))
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
