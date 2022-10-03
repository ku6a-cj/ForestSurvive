//
//  SideMenuView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI

struct SideMenuView: View {
    @Binding  var long: Double
    @Binding  var lat: Double
    @State  var long1:Double = 12.0
    @State  var lat1:Double = 12.0
    var body: some View {
        VStack {
            Text("Settings")
                .foregroundColor(Color.white)
                .font(.title)
            
            Divider()
                .frame(width:200,height: 2)
                .background(.white)
                .padding(.horizontal, 16)
                .blur(radius: 0.5)
           
                
            HStack {
                Image(systemName: "globe.europe.africa")
                    .foregroundColor(Color.white)
                NavigationLink(destination: Map(long: $long, lat: $lat)){
                        Text("Set route to Academy")
                    }
                    .font(.title)
                .foregroundColor(.white)
            }
            
            
            HStack {
                Image(systemName: "figure.climbing")
                    .foregroundColor(Color.white)
                NavigationLink(destination: FitnessCalc()){
                    Text("Fitness Calculators")
                }
                .font(.title)
            .foregroundColor(.white)
            }
            
            HStack {
                Image(systemName: "chart.bar.xaxis")
                    .foregroundColor(Color.white)
                NavigationLink(destination: RankingPoints()){
                    Text("Ranking Points")
                }
                .font(.title)
            .foregroundColor(.white)
            }
            
            
            HStack {
                Image(systemName: "newspaper")
                    .foregroundColor(Color.white)
                NavigationLink(destination: News()){
                    Text("News")
                }
                .font(.title)
            .foregroundColor(.white)
            }
            
            HStack {
                Image(systemName: "calendar.badge.exclamationmark")
                    .foregroundColor(Color.white)
                NavigationLink(destination: Calendar()){
                    Text("Calendar")
                }
                .font(.title)
            .foregroundColor(.white)
            }
            
            
            
            HStack {
                Image(systemName: "shareplay")
                    .foregroundColor(Color.white)
                Link(destination: URL(string: "https://github.com/ku6a-cj")!){
                    Text("GIT")
                }.font(.title)
                    .foregroundColor(.white)
            }
            
          
            
            Spacer()
        }
        .padding(16)
        .background(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    @State static var long: Double = 0.0
    @State static var lat: Double = 0.0
    static var previews: some View {
        SideMenuView(long: $long, lat: $lat)
    }
}

