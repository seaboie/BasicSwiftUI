//
//  SubView.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 27/12/2564 BE.
//
//https://www.youtube.com/watch?v=tnNFoZ7CkP8

import SwiftUI

struct SubView: View {
    
    @Binding var isShow: Bool
    
    let circleColor: Color
    let textColor: Color
    let text: String
    
    var body: some View {
        
        ZStack {
            Circle()
                .frame(width: 200, height: 200, alignment: Alignment.center)
                .foregroundColor(circleColor)
            
            Button {
                //
                isShow.toggle()
            } label: {
                Text(text)
                    .font(Font.system(size: 70, weight: Font.Weight.bold))
                    .foregroundColor(textColor)
            }
            .sheet(isPresented: $isShow) {
                //
            } content: {
                Text("New Page")
            }


        }
        
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(isShow: .constant(false), circleColor: Color.red, textColor: Color.white, text: "1")
    }
}
