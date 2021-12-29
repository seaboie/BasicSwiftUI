//
//  LocationListView.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 29/12/2564 BE.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        
        List {
            ForEach(vm.locations) { location in
                
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(Edge.Set.vertical, 4)
                .listRowBackground(Color.clear)
                    
            }
        }
        .listStyle(PlainListStyle())
    }
}

extension LocationListView {
    
    private func listRowView(location: Location) -> some View {
            
            HStack {
                
                if let imageName = location.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .frame(width: 45, height: 45, alignment: .center)
                        .cornerRadius(45 / 2)
                    
                }
                
                VStack(alignment: HorizontalAlignment.leading) {
                    Text(location.name)
                        .font(Font.headline)
                    
                    Text(location.cityName)
                        .font(Font.subheadline)
                }
            }

    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}
