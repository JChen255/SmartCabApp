//
//  SmartCabAppApp.swift
//  SmartCabApp
//
//  Created by Janine Chen on 10/4/23.
//

import SwiftUI

@main
struct SmartCabAppApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
