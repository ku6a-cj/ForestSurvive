//
//  Localization.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 03/10/2022.
//

import SwiftUI

struct Localization: View {
    @State var isSelected = false
    @State var locale = Locale.current
    @State var Location = "UNN"
    @State var picture = "flag.fill"
    var body: some View {
        HStack{
            VStack{
                Text("Location:")
                    .font(.headline)
                    .padding(.top, 6)
                    .foregroundColor(isSelected ? .white : .black)
                Text("\(Location)")
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .black)

            }.padding(.leading)
                .onAppear{
                Location = String(locale.regionCode ?? "UNN")
                
                }.frame(width: 90)
            
            VStack{
                if(Location == "PL"){
                    VStack {
                        HStack {
                            Text("xxxxxxxxxxxxxxxxxxxxxxxxxxx")
                                .padding(.top, 10.0)
                        }.background(Color.white)
                            .padding(.horizontal, -40.0)
                            .padding(.top, 10.0)
                            .foregroundColor(Color.white)
                            .frame(width: 10, height: 30)
                            .overlay{
                                Rectangle()
                                    .stroke(.gray , lineWidth: 1)
                                    .padding(.top, 10.0)
                                    .frame(width: 90, height: 40)
                            }

                        HStack {
                            Text("xxxxxxxxxxxxxxxxxxxxxxxxxxx")
                                .padding(.bottom, 10.0)
                        }.background(Color.red)
                            .padding(.horizontal, -40.0)
                            .padding(.bottom, 10.0)
                            .foregroundColor(Color.red)
                            .frame(width: 10, height: 30)
                            .overlay{
                                Rectangle()
                                    .stroke(.gray , lineWidth: 1)
                                    .padding(.bottom, 10.0)
                                    .frame(width: 90, height: 40)
                            }
                    }
                }else{
                    Image(systemName: "\(picture)")
                        .resizable()
                        .resizable()
                        .padding(.trailing, 10.0)
                        .frame(width: 60, height: 60)
                        .foregroundColor(isSelected ? .white : .black)
                }
               
            }
            .padding(.leading, 60.0)
            Spacer()
        }
        .padding()
        .background(Color(isSelected ? UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00) : .white))
        .cornerRadius(20)
       // .background(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
        .frame(width: 240, height: 160)
        .onTapGesture {
            isSelected.toggle()
        }

    }
}

struct Localization_Previews: PreviewProvider {
    static var previews: some View {
        Localization(isSelected: true)
            .previewLayout(.sizeThatFits)
        Localization(isSelected: false)
            .previewLayout(.sizeThatFits)
    }
}



