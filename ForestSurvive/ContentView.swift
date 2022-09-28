//
//  ContentView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack{
                Color.gray.ignoresSafeArea(.all, edges: .all)
                
                
                VStack {
                    Text("Forest Survive!")
                        .padding()
                }
                
                GeometryReader{ geo in
                    
                    HStack {
                        SideMenuView()
                            .offset(x:showMenu ? 0 : UIScreen.main.bounds.width)
                            //.offset(x:0)
                            //.offset(x: UIScreen.main.bounds.width)
                    }
                }
                .background(Color.mint.opacity(showMenu ? 0.5 : 0))
            }
           // .navigationTitle("Side Menu Demo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading){
                    Button{
                        //print("show menu")
                        self.showMenu.toggle()
                    } label: {
                        if(showMenu){
                            
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.black)
                        }else{
                            
                        Image(systemName: "text.justify")
                            .font(.title)
                            .foregroundColor(.black)
                        }

                    }
                    .padding(.trailing)
                }
            }
        }
 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
