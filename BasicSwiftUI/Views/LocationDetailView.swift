//
//  LocationDetailView.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 30/12/2564 BE.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let location: Location
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10 )
                
                VStack(alignment: HorizontalAlignment.leading, spacing: 16) {
                    
                    titleSection
                    
                    Divider()
                    
                    descriptionSection
                    
                    Divider()
                    
                    mapLayer
                    
                }
                .frame(maxWidth: .infinity, alignment: Alignment.leading)
                .padding()
                
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: Alignment.topLeading) {
            
            backButton
        }
    }
}

extension LocationDetailView {
    
    private var imageSection: some View {
        
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.size.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        
    }
    
    private var titleSection: some View {
        
        VStack(alignment: HorizontalAlignment.leading, spacing: 8) {
            Text(location.name)
                .font(Font.subheadline)
                .fontWeight(Font.Weight.semibold)
            
            Text(location.cityName)
                .font(Font.title3)
                .foregroundColor(Color.secondary)
        }
        
    }
    
    private var descriptionSection: some View {
        
        VStack(alignment: HorizontalAlignment.leading, spacing: 16) {
            Text(location.description)
                .font(Font.subheadline)
                .foregroundColor(Color.secondary)
            
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(Font.headline)
                    .tint(Color.blue)
            }
            
        }
        
    }
    
    private var mapLayer: some View {
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [location]) { location in
            
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: ContentMode.fill)
        .cornerRadius(20)
        
    }
    
    private var backButton: some View {
        
        Button {
            
            vm.sheetLocation = nil
            
        } label: {
            Image(systemName: "xmark")
                .font(Font.headline)
                .foregroundColor(Color.primary)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
        }

    }
}


struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}
