//
//  VideoDetailView.swift
//  SwiftUIVideoApp
//
//  Created by M.Ömer Ünver on 7.07.2023.
//

import SwiftUI
import AVKit
struct VideoDetailView: View {
    var video : VideoModel
    @State private var player: AVPlayer?
    @State var isActive = false
    var body: some View {
        ScrollView{
            VStack {
                    PlayerViewController(videoURL: video.sources)
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.7)
                    Spacer()
                
                Text(video.title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.orange)
                    .padding()
                Text(video.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
                    
            }
            .padding(.bottom)
        }
       
    }
}
struct PlayerViewController: UIViewControllerRepresentable {
    var videoURL: URL?
    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
            let controller = AVPlayerViewController()
            controller.modalPresentationStyle = .fullScreen
            controller.player = player
            controller.player?.play()
            
            return controller
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
            playerController.player?.pause()
        
        
    }
}
