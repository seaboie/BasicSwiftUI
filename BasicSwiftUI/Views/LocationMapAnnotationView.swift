//
//  LocationMapAnnotationView.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 29/12/2564 BE.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        
        VStack(spacing: 0.0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .font(Font.headline)
                .foregroundColor(Color.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(accentColor)
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -5)
                .padding(.bottom, 40)
        }
        .shadow(radius: 15)
        
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            LocationMapAnnotationView()
        }
    }
}
