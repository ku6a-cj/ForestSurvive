//
//  DaysTo.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 03/10/2022.
//

import SwiftUI
import Foundation

struct DaysTo: View {
    @State var isSelected = false
    @State var date = Date().formatted(date: .long , time: .omitted)
 //   @State var date1 = Date(timeIntervalSinceNow: )
    
    var body: some View {
        HStack{
            VStack{
                Text("Date:")
                    .font(.headline)
                    .padding(.top, 6)
                    .foregroundColor(isSelected ? .white : .black)
                Text("\(date)")
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .black)

            }.onAppear{

            }
            
            VStack{
                Image(systemName: "calendar")
                    .resizable()
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(isSelected ? .white : .black)

               
            }
            
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



struct DaysTo_Previews: PreviewProvider {
    static var previews: some View {
        DaysTo(isSelected: true)
            .previewLayout(.sizeThatFits)
        DaysTo(isSelected: false)
            .previewLayout(.sizeThatFits)
    }
}


