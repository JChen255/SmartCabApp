//
//  RideRequestView.swift
//  SmartCabApp
//
//  Created by Janine Chen on 10/6/23.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedType: RideType = .cabX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    var body: some View {
        VStack{
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 46, height: 8)
                .padding(.vertical, 8)
            
            // Ride Info
            HStack{
                VStack{
                    Circle()
                        .foregroundColor(Color(.systemGray5))
                        .frame(width: 8)
                    Rectangle()
                        .foregroundColor(Color(.systemGray5))
                        .frame(width: 2, height: 35)
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(width: 8, height: 8)
                }
                VStack(alignment: .leading){
                    Text("Current location")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.all)
                    if let location = locationViewModel.selectedCabLocation{
                        Text(location.title)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.all)
                    }
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text(locationViewModel.pickupTime ?? "")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding(.all)
                    Text(locationViewModel.dropOffTime ?? "")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.all)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            // Car selections
            HStack{
                VStack(){
                    Text("SUGGESTED RIDES")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding(.leading)
                Spacer()
            }
            .padding(.vertical)
            
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(RideType.allCases){ type in
                        VStack(alignment: .center){
                            Image(systemName: "car")
                                .resizable()
                                .frame(width: 50, height:40)
                                .padding(.top)
                            VStack(alignment: .center, spacing: 4){
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(type == selectedType ? .white : Color.theme.primaryTextColor)
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color(type == selectedType ? .white : .black))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 130)
                        .background(type == selectedType ? Color(.systemYellow) : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedType ? 1.1 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()){
                                selectedType = type
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
                .padding()
            // Payment
            HStack(){
                Text("Visa")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 45, height: 25)
                    .background(.black)
                    .cornerRadius(5)
                    .padding()
                Text("****1234")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.orange)
                }
                .padding()
            }
            .frame(width: 355, height: 40)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button{
                
            }label:{
                Text("CONFIRM RIDE")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 355, height: 40)
            .background(.orange)
            .cornerRadius(10)
        }
        .padding(.bottom, 20)
        .background(Color.theme.backgroundColor)
        .cornerRadius(12)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
