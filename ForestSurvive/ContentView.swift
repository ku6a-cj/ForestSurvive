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
    @State private var showWebView = false
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
               // Color.gray.ignoresSafeArea(.all, edges: .all)
                VStack {
//                    Button {
//                        showWebView.toggle()
//                    } label: {
//                        Text("WATSide")
//                    }
//                    .sheet(isPresented: $showWebView) {
//                        WebView(url: URL(string: "https://www.wojsko-polskie.pl/wat/articles/list/aktualnosci-w/")!)
//                    }
                    
                    WebView(url: URL(string: "https://www.wojsko-polskie.pl/wat/articles/list/aktualnosci-w/")!)
                    
                    
                    
                    Text("Set your lat and long")
                    
                    
                       
                    
                    
                    
                    HStack {
                        VStack {
                            TextField("latitude", value: $lat, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            
                            Divider()
                                .frame(height: 1)
                                .background(.gray)
                                .padding(.horizontal, 16)
                                .blur(radius: 0.5)
                            
                            Text("latitude")
                                .padding(.bottom, 5.0)
                        }.overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                        Spacer()
                        VStack {
                            TextField("longitude", value: $long, format: .number)
                                .multilineTextAlignment(TextAlignment.center)
                                .padding(.top, 7.0)
                            
                            Divider()
                                .frame(height: 1)
                                .background(.gray)
                                .padding(.horizontal, 16)
                                .blur(radius: 0.5)
                            
                            Text("longitude")
                                .padding(.bottom, 5.0)
                        }.overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.gray, lineWidth: 1))
                        Spacer()
                        
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
                .background(Color.green.opacity(showMenu ? 0.5 : 0))
            }
            .navigationTitle("Forset Survive")
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
