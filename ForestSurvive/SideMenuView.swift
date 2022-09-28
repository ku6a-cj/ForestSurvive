//
//  SideMenuView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI

struct SideMenuView: View {
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
            
            NavigationLink(destination: Map()){
                Text("Map")
            }
            .font(.title)
            .foregroundColor(.white)
            
            
            Link(destination: URL(string: "https://github.com/ku6a-cj")!){
                Text("GIT")
            }.font(.title)
                .foregroundColor(.white)
            
          
            
            Spacer()
        }
        .padding(16)
        .background(Color.mint)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
