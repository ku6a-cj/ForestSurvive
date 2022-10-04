//
//  DataBaseView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 04/10/2022.
//

import SwiftUI

struct DataBaseView: View {
    @State var isSelected = false
    @State var Points = "UNN"
    @State var DataM = "NN/NN/NN NN/NN"
    @State var GenderChoice = "Select your gender"

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "square.stack.3d.up.fill")
                                .foregroundColor(isSelected ? .white : .black)
                            Text("Points \(GenderChoice):")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                            Text("\(Points)")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                            
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(isSelected ? .white : .black)
                            Text("Date:")
                                .font(.headline)
                            .foregroundColor(isSelected ? .white : .black)
                            Text("\(DataM)")
                                .font(.headline)
                                .padding(.top, 6)
                            .foregroundColor(isSelected ? .white : .black)
                        }
                    }
                }
            }.onAppear{

            }
            
//            VStack{
//                Image(systemName: "chart.bar.xaxis")
//                    .resizable()
//                    .resizable()
//                    .frame(width: 70, height: 70)
//                    .foregroundColor(isSelected ? .white : .black)
//
//
//            }
            
        }
        .padding()
        .background(Color(isSelected ? UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00) : .white))
        .cornerRadius(20)
       // .background(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
        .frame(width: 300, height: 160)
        .onTapGesture {
            isSelected.toggle()
        }

    }
}

struct DataBaseView_Previews: PreviewProvider {
    static var previews: some View {
        DataBaseView(isSelected: true, Points: "NN", DataM: "NN/NN/NN NN/NN", GenderChoice: "Select" )
            .previewLayout(.sizeThatFits)
        DataBaseView(isSelected: false,  Points: "NN", DataM: "NN/NN/NN NN/NN", GenderChoice: "Select" )
            .previewLayout(.sizeThatFits)
    }
}
