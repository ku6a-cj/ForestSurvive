//
//  calculator.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 29/09/2022.
//

import SwiftUI

struct calculator: View {
    
    @State private var degree = 0.0
    @State private var thousand = 0.0
    @State private var degree1 = 0.0
    @State private var thousand1 = 0.0
    
    var body: some View {
        VStack{
            Spacer()
            Text("Calculate degree to thousand")
            HStack{
                Spacer()
                VStack {
                    TextField("degree", value: $degree, format: .number)
                        .multilineTextAlignment(TextAlignment.center)
                        .padding(.top, 7.0)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                        .padding(.horizontal, 16)
                        .blur(radius: 0.5)
                    
                    Text("degree")
                        .padding(.bottom, 5.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 1))
                Spacer()
                VStack {
                    TextField("thousand", value: $thousand, format: .number)
                        .multilineTextAlignment(TextAlignment.center)
                        .padding(.top, 7.0)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                        .padding(.horizontal, 16)
                        .blur(radius: 0.5)

                    Text("thousand NATO")
                        .padding(.bottom, 5.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 1))
                Spacer()
            }

            Button {
                thousand = degree / 0.05625
            } label: {
                Text("calculate")
                    .padding(.all, 13.0)
                    .colorMultiply(Color.black)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1))


            Spacer()

            Text("Calculate thousand to degree")
            HStack{
                Spacer()
    
                VStack {
                    TextField("thousand1", value: $thousand1, format: .number)
                        .multilineTextAlignment(TextAlignment.center)
                        .padding(.top, 7.0)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                        .padding(.horizontal, 16)
                        .blur(radius: 0.5)

                    Text("thousand NATO")
                        .padding(.bottom, 5.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 1))
                Spacer()
                VStack {
                    TextField("degree1", value: $degree1, format: .number)
                        .multilineTextAlignment(TextAlignment.center)
                        .padding(.top, 7.0)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.gray)
                        .padding(.horizontal, 16)
                        .blur(radius: 0.5)
                    
                    Text("degree")
                        .padding(.bottom, 5.0)
                }.overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 1))
                Spacer()
            }

            Button {
                degree1 =   0.05625 * thousand1
            } label: {
                Text("calculate")
                    .padding(.all, 13.0)
                    .colorMultiply(Color.black)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1))


            Spacer()
        }
        
    }
}

struct calculator_Previews: PreviewProvider {
    static var previews: some View {
        calculator()
    }
}
