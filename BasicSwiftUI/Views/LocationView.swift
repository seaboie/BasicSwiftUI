//
//  LocationView.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 28/12/2564 BE.
//

import SwiftUI
import MapKit


struct LocationView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
