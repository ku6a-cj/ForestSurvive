//
//  RankingPoints.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 29/09/2022.
//

import SwiftUI

struct RankingPoints: View {
    @State var GenderChoice = "Select your gender"
    @State var  selectedFrameworkIndex = 0
    @State var  secondSelectedFrameworkIndex = 0
    @State var  thirdSelectedFrameworkIndex = 0
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
    @State var FirstSubjectName = "Interview"
    @State var FirstSubjectProc = 0
    @State var SecondSubjectName = "Matematic"
    @State var SecondSubjectProc = 0.0
    @State var SecondSubjectExtended = false
    @State var ThirdSubjectName = "Subject selected"
    @State var ThirdSubjectProc = 0.0
    @State var ThirdSubjectExtended = false
    @State var FourthSubjectName = "Native language"
    @State var FourthSubjectProc = 0.0
    @State var FourthSubjectExtended = false
    @State var FifthSubjectName = "English language"
    @State var FifthSubjectProc = 0.0
    @State var FifthSubjectExtended = false
    @State var AllPoints = 0.0
    @State var PePoints = 0
    @State var InterviewPoints = 0
    @State var MaturaPoints = 0.0
    @State private var isEditing = false
    @State private var isEditing2 = false
    @State private var isEditing3 = false
    @State private var isEditing4 = false
    @State var SecondSubjectProcFin = 0.0
    @State var ThirdSubjectProcFin = 0.0
    @State var FourthSubjectProcFin = 0.0
    @State var FifthSubjectProcFin = 0.0
    @State var GenderChoiceImage = "person.circle.fill"
    
    func testNumberAsString(_ numberAsString: String) -> NSDecimalNumber{
        let num = NSDecimalNumber.init(string: numberAsString)
        let behaviour = NSDecimalNumberHandler(roundingMode:.down, scale: 2, raiseOnExactness: false,  raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let numRounded = num.rounding(accordingToBehavior: behaviour)

        return numRounded
    }
    
    
    
    
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
                    icon: {Image(systemName: GenderChoiceImage)}
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
                    Section(header: Text("Sport")) {
                        Picker(selection: $selectedFrameworkIndex, label: Text("\(FirstCompetitionName)")) {
                            ForEach(0 ..< frameworksFirscCompetitionMan.count) {
                                Text(self.frameworksFirscCompetitionMan[$0])
                            }
                        }
                        Picker(selection: $secondSelectedFrameworkIndex, label: Text("\(SecondCompetitionName)")) {
                            ForEach(0 ..< frameworksSecondCompetitionMan.count) {
                                Text(self.frameworksSecondCompetitionMan[$0])
                            }
                        }
                        Picker(selection: $thirdSelectedFrameworkIndex, label: Text("\(ThirdCompetitionName)")) {
                            ForEach(0 ..< frameworksThirdCompetitionMan.count) {
                                Text(self.frameworksThirdCompetitionMan[$0])
                            }
                        }
                    }
                }else{
                    Section(header: Text("Sport")) {
                        Picker(selection: $selectedFrameworkIndex, label: Text("\(FirstCompetitionName)")) {
                            ForEach(0 ..< frameworksFirscCompetitionWoman.count) {
                                Text(self.frameworksFirscCompetitionWoman[$0])
                            }
                        }
                        Picker(selection: $secondSelectedFrameworkIndex, label: Text("\(SecondCompetitionName)")) {
                            ForEach(0 ..< frameworksSecondCompetitionWoman.count) {
                                Text(self.frameworksSecondCompetitionWoman[$0])
                            }
                        }
                        Picker(selection: $thirdSelectedFrameworkIndex, label: Text("\(ThirdCompetitionName)")) {
                            ForEach(0 ..< frameworksThirdCompetitionWoman.count) {
                                Text(self.frameworksThirdCompetitionWoman[$0])
                            }
                        }
                    }
                    }
                
                
                Section(header: Text("Matura")){
                    
                    Toggle(isOn:$SecondSubjectExtended , label: {
                        HStack{
                            Text("\(SecondSubjectName)")
                            Text("\(testNumberAsString("\(String(SecondSubjectProc))"))")
                                .foregroundColor(isEditing ? .red : Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                            Spacer()
                            Text("Extended")
                        }
                    })
                    
                    
                  
                    Slider(value: $SecondSubjectProc,
                            in: 0...100,
                            step: 1
                        ) {
                            Text("SecondSubjectProc")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        } onEditingChanged: { editing in
                            isEditing = editing
                        }
                    
                    
                    Toggle(isOn:$ThirdSubjectExtended , label: {
                        HStack{
                            Text("\(ThirdSubjectName)")
                            Text("\(testNumberAsString("\(String(ThirdSubjectProc))"))")
                                .foregroundColor(isEditing2 ? .red : Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                            Spacer()
                            Text("Extended")
                        }
                    })
                    
                    
                  
                    Slider(value: $ThirdSubjectProc,
                            in: 0...100,
                            step: 1
                        ) {
                            Text("SecondSubjectProc")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        } onEditingChanged: { editing in
                            isEditing2 = editing
                        }
                    
                    
                    Toggle(isOn:$FourthSubjectExtended , label: {
                        HStack{
                            Text("\(FourthSubjectName)")
                            Text("\(testNumberAsString("\(String(FourthSubjectProc))"))")
                                .foregroundColor(isEditing3 ? .red : Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                            Spacer()
                            Text("Extended")
                        }
                    })
                    
                    
                  
                    Slider(value: $FourthSubjectProc,
                            in: 0...100,
                            step: 1
                        ) {
                            Text("SecondSubjectProc")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        } onEditingChanged: { editing in
                            isEditing3 = editing
                        }
                    
                    Toggle(isOn:$FifthSubjectExtended , label: {
                        HStack{
                            Text("\(FifthSubjectName)")
                            Text("\(testNumberAsString("\(String(FifthSubjectProc))"))")
                                .foregroundColor(isEditing4 ? .red : Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                            Spacer()
                            Text("Extended")
                        }
                    })
                    
                    
                  
                    Slider(value: $FifthSubjectProc,
                            in: 0...100,
                            step: 1
                        ) {
                            Text("SecondSubjectProc")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        } onEditingChanged: { editing in
                            isEditing4 = editing
                        }
                    
                }
                
                
                
                Section(header: Text("Interview")){
                    HStack{
                        Text("\(FirstSubjectName)")
                        Text("\(FirstSubjectProc)")
                            .foregroundColor(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                            Spacer()
                            Stepper(value: $FirstSubjectProc, in: 0...30) {
                                EmptyView()
                            }
                    }

                }
                
                       
            }
            



            VStack {
                Button {
                    FirstCompetitionPoints = selectedFrameworkIndex
                    SecondCompetitionPoints = secondSelectedFrameworkIndex
                    ThirdCompetitionPoints = thirdSelectedFrameworkIndex
                    PePoints = FirstCompetitionPoints + SecondCompetitionPoints + ThirdCompetitionPoints
                    InterviewPoints = FirstSubjectProc
                    
                    if(SecondSubjectExtended == false){
                        SecondSubjectProcFin = SecondSubjectProc * 0.5 * 0.45
                    }else{
                        SecondSubjectProcFin = SecondSubjectProc * 0.45
                    }
                    
                    if(ThirdSubjectExtended == false){
                        ThirdSubjectProcFin = ThirdSubjectProc * 0.5 * 0.3
                    }else{
                        ThirdSubjectProcFin = ThirdSubjectProc * 0.3
                    }
                    
                    if(FourthSubjectExtended == false){
                        FourthSubjectProcFin = FourthSubjectProc * 0.5 * 0.05
                    }else{
                        FourthSubjectProcFin = FourthSubjectProc * 0.05
                    }
                    
                    if(FifthSubjectExtended == false){
                        FifthSubjectProcFin = FifthSubjectProc * 0.5 * 0.2
                    }else{
                        FifthSubjectProcFin = FifthSubjectProc * 0.2
                    }
                    
                    MaturaPoints = SecondSubjectProcFin + ThirdSubjectProcFin + FourthSubjectProcFin + FifthSubjectProcFin
                    AllPoints = Double(PePoints + InterviewPoints) + MaturaPoints
                    Shared.shared.MyPoints = AllPoints
                    
                } label: {
                    Text("calculate")
                        .padding(.all, 13.0)
                        .colorMultiply(Color.black)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1))
                
                
                HStack{
                    Spacer()
                    VStack {
                        Text("PE Points")
                        Text("\(PePoints)")
                    }
                    Spacer()
                    VStack {
                        Text("Matura Points")
                        Text("\(testNumberAsString("\(String(MaturaPoints))"))")
                    }
                    Spacer()
                    VStack {
                        Text("Interview Points")
                        Text("\(InterviewPoints)")
                    }
                    Spacer()
                }
            }
            
            
        
            
         //   Text("Total points = \(AllPoints)")
            
        }
    }
    
    
    
    struct RankingPoints_Previews: PreviewProvider {
        static var previews: some View {
            RankingPoints()
        }
    }
}



