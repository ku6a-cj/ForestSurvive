//
//  SimulatioScoreView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 02/10/2022.
//
import Foundation
import SwiftUI

struct SimulatioScoreView: View {
    
    @State var MyPoints1 = Shared.shared.MyPoints
    @State var isSelected = false
    
    var body: some View {
        HStack{
            VStack{
                Button {
                    MyPoints1 = Shared.shared.MyPoints
                } label: {
                    VStack {
                        Text("My points: ")
                            .font(.headline)
                            .padding(.top, 6)
                        .foregroundColor(isSelected ? .white : .black)
                        Text(String(MyPoints1 ?? 0))
                            .font(.title)
                            .foregroundColor(isSelected ? .white : .black)
                    }      
                }
            }
            
            VStack{
                Image(systemName: "figure.archery")
                    .resizable()
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(isSelected ? .white : .black)

               
            }
            
        }
        .padding()
        .background(Color(isSelected ? .blue : .white))
        .cornerRadius(20)
       // .background(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
        .frame(width: 300, height: 10)
        .onTapGesture {
            isSelected.toggle()
        }


    }
    
}

struct SimulatioScoreView_Previews: PreviewProvider {
    static var previews: some View {
        SimulatioScoreView(isSelected: false)
            .previewLayout(.sizeThatFits)
        SimulatioScoreView(isSelected: true)
            .previewLayout(.sizeThatFits)
     
    }
}
