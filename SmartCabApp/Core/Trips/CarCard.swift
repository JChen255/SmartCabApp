//
//  CarCard.swift
//  SmartCabApp
//
//  Created by Janine Chen on 10/6/23.
//

import SwiftUI

struct CarCard: View {
    let carName: String
    let price: String
    var body: some View {
        ZStack(){
            Rectangle()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 110, height: 140)
                .cornerRadius(10)
            Image(systemName: "car")
                .resizable()
                .frame(width: 50, height:40)
                .offset(y:-20)
            Text(carName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.gray)
                .offset(y: 30)
            Text(price)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.gray)
                .offset(y: 50)
        }
    }
}

struct CarCard_Previews: PreviewProvider {
    static var previews: some View {
        CarCard(carName: "UberX", price: "$22.04")
    }
}
