//
//  BasicSwiftUIApp.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 23/12/2564 BE.
//

import SwiftUI

@main
struct BasicSwiftUIApp: App {
    
    @StateObject private var vm = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LocationView()
                .environmentObject(vm)
        }
    }
}
