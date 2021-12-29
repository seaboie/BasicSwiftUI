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
            
            VStack {
                
                header
                .padding()
                
                Spacer()
            }
        }
    }
}

extension LocationView {
    
    private var header: some View {
        
        VStack {
            
            Button {
                vm.toggleLocationList()
            } label: {
                
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(Font.title2)
                    .fontWeight(Font.Weight.black)
                    .foregroundColor(Color.primary)
                    .frame(height: 55, alignment: Alignment.center)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: Alignment.leading) {
                        Image(systemName: "arrow.down")
                            .font(Font.headline)
                            .foregroundColor(Color.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            }

            
            if vm.showLocationList {
                LocationListView()
            }
            
            
        }
        .background(.thickMaterial)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
