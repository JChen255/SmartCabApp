//
//  LocationSearchActivationview.swift
//  SmartCabApp
//
//  Created by Janine Chen on 10/5/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 8, height: 8)
                .padding(.horizontal)
                .foregroundColor(.orange)
            
            Text("Where to ?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color(.white))
                .shadow(radius: 5)
        )
    }
}

struct LocationSearchActivationview_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
