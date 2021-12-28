//
//  ContentView.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 23/12/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShow = false
    var body: some View {
        
        TabView {
            SubView(isShow: $isShow, circleColor: Color.blue, textColor: Color.white, text: "1")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SubView(isShow: $isShow, circleColor: Color.red, textColor: Color.white, text: "2")
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            SubView(isShow: $isShow, circleColor: Color.green, textColor: Color.white, text: "3")
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
