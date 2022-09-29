//
//  RankingPoints.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 29/09/2022.
//

import SwiftUI

struct RankingPoints: View {
    @State var GenderChoice = "Select your gender"
    @State var  selectedFrameworkIndex = 1
    @State var  secondSelectedFrameworkIndex = 1
    @State var  thirdSelectedFrameworkIndex = 1
    @State var frameworksFirscCompetitionMan = ["5:01>","4:36-5:00","4:11-4:35","3:46-4:10","3:45<"]
    @State var frameworksFirscCompetitionWoman = ["5:01>","4:36-5:00","4:11-4:35","3:46-4:10","3:45<"]
    @State var frameworksSecondCompetitionMan = ["0-1","2","3","4","5","6","7-8","9-10","11>"]
    @State var frameworksSecondCompetitionWoman = ["0-3","4-5","6-10","11-15","16-19","20-24", "22-25", "26-29", "30>"]
    @State var frameworksThirdCompetitionMan = ["34,6≥","33,9-34,5","33,3-33,8","32,7-33,2", "32,1-32,6", "31,5-32,0" , "30,9-31,4", "30,1-30,8", "30,0 ≤"]
    @State var frameworksThirdCompetitionWoman = ["30,1≥", "29,3-30,0", "28,6-29,2", "28,1-28,5", "27,6-28,0", "27,1-27,5", "26,5-27,0", "25,9-26,4", "26,0 ≤"]
    @State var FirstCompetitionPoints = 0
    @State var SecondCompetitionPoints = 0
    @State var ThirdCompetitionPoints = 0
    @State var FirstCompetitionName = "First Competition"
    @State var SecondCompetitionName = "Second Competition"
    @State var ThirdCompetitionName = "Second Competition"
    @State var FirstSubjectName = "Matematic"
    @State var FirstSubjectProc = 0
    @State var AllPoints = 0
    @State var PePoints = 0
    @State var MaturaPoints = 0
    
    
    
    
    
    
    var body: some View {
        
        
        VStack {
            Text("Ranking Points Calculator")
                .font(.title)
            Menu{
                Button(action: {
                    GenderChoice="male"
                    FirstCompetitionName = "1000m Run"
                    SecondCompetitionName = "Pull ups"
                    ThirdCompetitionName = " Relay Runs of 10 x 10 metres"
                }, label: {
                    Text("male")
                })
                Button(action: {
                    GenderChoice="female"
                    FirstCompetitionName = "800m Run"
                    SecondCompetitionName = "Arm hang"
                    ThirdCompetitionName = "Zigzag Run (envelope)"
                }, label: {
                    Text("female")
                })
            }label:{
                Label(
                    title:{Text("\(GenderChoice)")},
                    icon: {Image(systemName:"person.circle.fill")}
                ).foregroundColor(Color.black)
            }
            if(GenderChoice=="male"){
                // Text("You are a man")
            }
            if(GenderChoice=="female"){
                // Text("You are a wonam")
            }
            Form {
                if(GenderChoice == "male"){
                    Section {
                        Picker(selection: $selectedFrameworkIndex, label: Text("\(FirstCompetitionName)")) {
                            ForEach(0 ..< frameworksFirscCompetitionMan.count) {
                                Text(self.frameworksFirscCompetitionMan[$0])
                            }
                        }
                    }
                    
                    Section {
                        Picker(selection: $secondSelectedFrameworkIndex, label: Text("\(SecondCompetitionName)")) {
                            ForEach(0 ..< frameworksSecondCompetitionMan.count) {
                                Text(self.frameworksSecondCompetitionMan[$0])
                            }
                        }
                    }
                    
                    Section {
                        Picker(selection: $thirdSelectedFrameworkIndex, label: Text("\(ThirdCompetitionName)")) {
                            ForEach(0 ..< frameworksThirdCompetitionMan.count) {
                                Text(self.frameworksThirdCompetitionMan[$0])
                            }
                        }
                    }
                    
                }else{
                    Section {
                        Picker(selection: $selectedFrameworkIndex, label: Text("\(FirstCompetitionName)")) {
                            ForEach(0 ..< frameworksFirscCompetitionWoman.count) {
                                Text(self.frameworksFirscCompetitionWoman[$0])
                            }
                        }
                    }
                    
                    Section {
                        Picker(selection: $secondSelectedFrameworkIndex, label: Text("\(SecondCompetitionName)")) {
                            ForEach(0 ..< frameworksSecondCompetitionWoman.count) {
                                Text(self.frameworksSecondCompetitionWoman[$0])
                            }
                        }
                    }
                    
                    Section {
                        Picker(selection: $thirdSelectedFrameworkIndex, label: Text("\(ThirdCompetitionName)")) {
                            ForEach(0 ..< frameworksThirdCompetitionWoman.count) {
                                Text(self.frameworksThirdCompetitionWoman[$0])
                            }
                        }
                    }
                }
                
                Text("\(FirstSubjectName)")
                TextField("", value: $FirstSubjectProc, formatter: NumberFormatter())
                        .frame(width: 50)
                    Stepper(value: $FirstSubjectProc, in: 0...100) {
                        EmptyView()
                    }
                
            }
            



            Button {
                FirstCompetitionPoints = selectedFrameworkIndex
                SecondCompetitionPoints = secondSelectedFrameworkIndex
                ThirdCompetitionPoints = thirdSelectedFrameworkIndex
                PePoints = FirstCompetitionPoints + SecondCompetitionPoints + ThirdCompetitionPoints
                AllPoints = PePoints + MaturaPoints
            } label: {
                Text("calculate")
                    .padding(.all, 13.0)
                    .colorMultiply(Color.black)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1))
            
            
            HStack{
                Text("PE Points = \(PePoints)")
                Text("Matura Points = \(MaturaPoints)")
            }
            
            Text("Total points = \(AllPoints)")
            
        }
    }
    
    
    
    struct RankingPoints_Previews: PreviewProvider {
        static var previews: some View {
            RankingPoints()
        }
    }
}



