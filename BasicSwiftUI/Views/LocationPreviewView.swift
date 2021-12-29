//
//  LocationPreviewViw.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 29/12/2564 BE.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16.0) {
                
                imageSection
                
                titleSection
            }
            
            
            VStack(spacing: 12.0) {
                
                learnMoreButton
                
                nextButton

            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Material.ultraThinMaterial).offset(y: 55))
        .cornerRadius(10)
    
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(16)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(16)
        
    }
    
    private var titleSection: some View {
        
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(Font.title2)
                .fontWeight(Font.Weight.bold)
            
            Text(location.cityName)
                .font(Font.subheadline)
        }
        
        .frame(maxWidth: .infinity, alignment: Alignment.leading)
        
    }
    
    private var learnMoreButton: some View {
        
        Button {
            //
        } label: {
            Text("Learn More")
                .font(Font.headline)
                .frame(width: 125, height: 30, alignment: .center)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        
        Button {
            //
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(Font.headline)
                .frame(width: 125, height: 30, alignment: .center)
        }
        .buttonStyle(.bordered)
    }
}

struct LocationPreviewViw_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationViewModel())
        
    }
}
