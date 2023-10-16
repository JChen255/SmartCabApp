//
//  ActionButton.swift
//  SmartCabApp
//
//  Created by Janine Chen on 10/5/23.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    var body: some View {
        Button{
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.orange)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading )
    }
    
    func actionForState(_ state: MapViewState){
        switch state{
        case .noInput:
            print("DEBUG: No Input")
        case .seachingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedCabLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String{
        switch state{
        case .noInput:
            return "line.3.horizontal"
        case .seachingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
