//
//  BmiCalc.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 02/10/2022.
//

import SwiftUI

struct BmiCalc: View {
    
    @State var Height = 187
    @State var Weight = 90
    @State var BMI = 0.0
    @State var ResoultString = "Press to see resoult"
    @State var interpretation = ""
    
    
    func testNumberAsString(_ numberAsString: String) -> NSDecimalNumber{
        let num = NSDecimalNumber.init(string: numberAsString)
        let behaviour = NSDecimalNumberHandler(roundingMode:.down, scale: 2, raiseOnExactness: false,  raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        let numRounded = num.rounding(accordingToBehavior: behaviour)

        return numRounded
    }
    
    func interpretatorBMI(BMI: Double){
        let prefix = "Interpretation of your result: "
        switch BMI {
        case 0..<16.0:
            interpretation = prefix + "starvation"
        case 16.0..<16.9:
            interpretation = prefix + "emaciation"
        case 16.9..<18.5:
            interpretation = prefix + "underweight"
        case 18.5..<24.9:
            interpretation = prefix + "correct weight"
        case 24.9..<29.9:
            interpretation = prefix + "overweight"
        case 29.9..<34.9:
            interpretation = prefix + "degree I obesity"
        case 34.9..<39.9:
            interpretation = prefix + "2nd degree obesity"
        default:
            interpretation = prefix + "grade III obesity"
            break
            
        }
    }
    
    var body: some View {
        VStack {
            Text("Bmi Calculator")
                .font(.title)
            Form{
                Section(header: Text("Data Form")){
                    VStack {
                        HStack{
                            Spacer()
                            Text("Your Height: ")
                            Spacer()
                            TextField("Height", value: $Height, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            Spacer()
                            Text("cm")
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            Text("Your Weight: ")
                            Spacer()
                            TextField("Weight", value: $Weight, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            Spacer()
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
                    BMI = (Double(Weight)/Double(pow(Double(Height),Double(2))))*10000
                    ResoultString = "Your BMI = " + String("\(testNumberAsString("\(String(BMI))"))")
                    interpretatorBMI(BMI: BMI)
                }
            }
        }
    }
}

struct BmiCalc_Previews: PreviewProvider {
    static var previews: some View {
        BmiCalc()
    }
}
