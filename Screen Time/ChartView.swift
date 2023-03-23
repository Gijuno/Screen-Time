//
//  ContentView.swift
//  TestDeviceActivity2
//
//  Created by Tarık Yılıkoğlu on 6.07.2022.
//

import SwiftUI
import DeviceActivity
import MediaPlayer

struct ChartView: View {

    @State private var context: DeviceActivityReport.Context = .init(rawValue: "Total Activity")
    @State private var filter = DeviceActivityFilter(
        segment: .daily(
            during: Calendar.current.dateInterval(
               of: .day, for: .now
            )!
        ),
        users: .all,
        devices: .init([.iPhone, .iPad])
    )


    var body: some View {
        ZStack {
            STProgressView()
            DeviceActivityReport(context, filter: filter)
            VStack {
                Button(action: {
                    let musicPlayer = MPMusicPlayerController.systemMusicPlayer
                    let nowPlayingItem = musicPlayer.nowPlayingItem
                    if (nowPlayingItem != nil) {
                        print(nowPlayingItem?.title ?? "Error playing")
                    } else {
                        print("Nothing's playing")
                    }
                }, label: {
                    Text("Play")
                })
                Button(action: {
                    let playingInfo = MPNowPlayingInfoCenter.default().nowPlayingInfo
                    print(playingInfo ?? "error")
                }, label: {
                    Text("버튼2")
                })
            }
        }
    }
}
