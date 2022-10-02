//
//  HRmaxView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 02/10/2022.
//

import SwiftUI

struct HRmaxView: View {
    
    @State var GenderChoice = "Select your gender"
    @State var GenderChoiceImage = "person.circle.fill"
    @State var age = 22
    @State var Weight = 90
    @State var ResoultString = "Press to see resoult"
    @State var interpretation = " "
    @State var HRMAX = 0.0
    
    var body: some View {
        
        
        
        VStack {
            Text("HRMAX Calculator")
                .font(.title)
            Menu{
                Button(action: {
                    GenderChoice="male"
                }, label: {
                    Text("male")
                })
                Button(action: {
                    GenderChoice="female"
                }, label: {
                    Text("female")
                })
            }label:{
                Label(
                    title:{Text("\(GenderChoice)")},
                    icon: {Image(systemName: GenderChoiceImage)}
                ).foregroundColor(Color.black)
            }
            
            
            
            
            Form{
                Section(header: Text("Insert data")){
                    VStack{
                        HStack{
                            Text("Insert your age")
                            TextField("Age", value: $age, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        HStack{
                            Text("Your Weight: ")
                            TextField("Weight", value: $Weight, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)

                            Text("kg")
                            Spacer()
                        }

                    }
                }
                
                Section(header: Text("Resoult")){
                    VStack(alignment: .center) {
                        Spacer()
                        HStack {
                            Text("\(ResoultString)")
                                .multilineTextAlignment(.center)
                            .padding(.top, 7.0)
                        }
                        Spacer()
                        Text("\(interpretation)")
                            .multilineTextAlignment(TextAlignment.center)
                            .padding(.bottom, 7.0)
                        Spacer()
                    }
                    
                }.onTapGesture {
                    if(GenderChoice == "male"){
                        HRMAX = 210 - 0.5*Double(age)-0.022*Double(Weight)+4
                    }else{
                        HRMAX = 210-0.5*Double(age)-0.022*Double(Weight)
                    }
                    
                    ResoultString = "Your hr max = " + String(HRMAX)

                    
                }
            }
        }
        
    }
}


struct HRmaxView_Previews: PreviewProvider {
    static var previews: some View {
        HRmaxView()
    }
}
