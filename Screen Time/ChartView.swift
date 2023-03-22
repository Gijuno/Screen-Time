//
//  ContentView.swift
//  TestDeviceActivity2
//
//  Created by Tarık Yılıkoğlu on 6.07.2022.
//

import SwiftUI
import DeviceActivity
import MediaPlayer

//struct ChartView: View {
//
//    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
//    @State private var filter = DeviceActivityFilter(
//        segment: .daily(
//            during: Calendar.current.dateInterval(
//               of: .day, for: .now
//            )!
//        ),
//        users: .all,
//        devices: .init([.iPhone, .iPad])
//    )
//
//
//    var body: some View {
//        ZStack {
//            STProgressView()
//            DeviceActivityReport(context, filter: filter)
//            VStack {
//                Button(action: {
//                    let musicPlayer = MPMusicPlayerController.systemMusicPlayer
//                    let nowPlayingItem = musicPlayer.nowPlayingItem
//                    if (nowPlayingItem != nil) {
//                        print(nowPlayingItem?.title ?? "Error playing")
//                    } else {
//                        print("Nothing's playing")
//                    }
//                }, label: {
//                    Text("Play")
//                })
//                Button(action: {
//                    let playingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo
//                    print(playingInfo ?? "error")
//                }, label: {
//                    Text("버튼2")
//                })
//            }
//        }
//    }
//}
//
//


import AVFoundation

struct ChartView: View {
    @State var nowPlaying: (title: String, artist: String)?
    let audioSession = AVAudioSession.sharedInstance()
    @State var player: AVPlayer?
    @State var timeObserverToken: Any?
    
    var body: some View {
        VStack {
            Button("Get Song Info") {
                if let nowPlaying = nowPlaying {
                    print("Currently playing: \(nowPlaying.title) by \(nowPlaying.artist)")
                } else {
                    print("No music is currently playing.")
                }
            }
        }
        .onAppear {
            try? audioSession.setCategory(AVAudioSession.Category.playback)
            self.player = AVPlayer()
            print(self.player?.currentItem?.nowPlayingInfo)
            detectSongChange()
            self.player?.play()
        }
        .onDisappear {
            self.player?.pause()
            self.player = nil
            if let token = self.timeObserverToken {
                self.player?.removeTimeObserver(token)
            }
        }
    }
    
    private func detectSongChange() {
        guard audioSession.currentRoute.outputs.first != nil else {
            nowPlaying = nil
            print("nowplying is nil")
            return
        }
        
//        if nowPlayingTitle.contains("Spotify") {
//            // Use a specific method to get the currently playing song information for the Spotify app
//            nowPlaying = getSpotifyNowPlaying()
//        } else if nowPlayingTitle.contains("YouTube") {
//            // Use a specific method to get the currently playing song information for the YouTube Music app
//            nowPlaying = getYouTubeNowPlaying()
//        } else {
//            // For other third-party music apps, you can try to use the MPNowPlayingInfoCenter method
//            let nowPlayingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo
//            if let title = nowPlayingInfo?[MPMediaItemPropertyTitle] as? String, let artist = nowPlayingInfo?[MPMediaItemPropertyArtist] as? String {
//                nowPlaying = (title, artist)
//            } else {
//                nowPlaying = nil
//            }
//        }
    }
    
//    private func getSpotifyNowPlaying() -> (title: String, artist: String)? {
//        // Use the Spotify iOS SDK or other methods to get the currently playing song information for the Spotify app
//        // ...
//        return nil
//    }
//
//    private func getYouTubeNowPlaying() -> (title: String, artist: String)? {
//        // Use the YouTube Music API or other methods to get the currently playing song information for the YouTube Music app
//        // ...
//        return nil
//    }
}

