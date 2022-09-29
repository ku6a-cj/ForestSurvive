//
//  ContentView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenu: Bool = false
    @State  var long = 20.900672
    @State  var lat = 52.253188
    
    var body: some View {
        NavigationView {
            
            ZStack{
               // Color.gray.ignoresSafeArea(.all, edges: .all)
                
                
                VStack {
                    Text("Set your lat and long")
                    HStack {
                               TextField("Enter your latitude", value: $lat, format: .number)
                                   .textFieldStyle(.roundedBorder)
                                   .padding()
                                TextField("Enter your longitude", value: $long, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                    .padding()
                        
    //                    Button(action: {
    //
    //                    }, label: {
    //                        Text("OK")
    //                    })
                    }
                }
                
                GeometryReader{ geo in
                    
                    HStack {
                        SideMenuView(long: $long, lat: $lat)
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
