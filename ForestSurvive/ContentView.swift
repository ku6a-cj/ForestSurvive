//
//  ContentView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI
import CoreData
import Combine
import MapKit




struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)]) // here i can sort resoults
    private var tasks: FetchedResults<Task>
    
    @StateObject var deviceLocationService = DeviceLocationService.shared

    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0, 0)
    
    @State private var showMenu: Bool = false
    @State  var long = 21.0
    @State  var lat = 53.0
    @State private var showWebView = false
    @State var MyPoints1 = Shared.shared.MyPoints
    
    
    
    init(){
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.titleTextAttributes=[.foregroundColor: UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor:UIColor.systemBackground]
        navBarApperance.backgroundColor = UIColor.white
        navBarApperance.shadowColor = .clear
        UINavigationBar.appearance().scrollEdgeAppearance = navBarApperance
        UINavigationBar.appearance().tintColor = UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)
    }
    

    
    
    var body: some View {
        
        
        NavigationView {
            
            ZStack{
                // Color.gray.ignoresSafeArea(.all, edges: .all)
                Form {
                    Section(header: Text("Your Last Simulation  Points") ){
                        HStack{
                            Spacer()
                            VStack{
                                Text(String(MyPoints1 ?? 0))
                                    .padding(.top)
                                Button {
                                    MyPoints1 = Shared.shared.MyPoints
                                    lat = coordinates.lat
                                    long = coordinates.lon
                                   // addResoult()
                                } label: {
                                    Image(systemName: "arrow.clockwise")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30)
                                        .foregroundColor(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                                        .padding(.all, 13.0)
                                    
                                    
                                    
                                    
                                    
                                }
                            }
                            Spacer()
                            
                            Image(systemName: "figure.archery")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                                .padding(.leading, 100.0)
                            
                            Spacer()
                            
                            
                            
                        }
                        
                        
                        
                    }
                    Section(header: Text("Your location") ) {
                        VStack {
                            MapVie(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                                .frame(height:280)
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
                                }.onAppear{
                                    observeCoordinateUpdates()
                                    observeDeniedLocationAccess()
                                    deviceLocationService.requestLocationUpdates()
                                    
                                }
                                    .overlay(
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
                            }.onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                                    print("done")
                                    lat = coordinates.lat
                                    long = coordinates.lon
                                })
                               
                            }
                            
                        }
                        
                    
                        
                    }
                    
                    Section(header: Text("Points simulation data") ){
                        ForEach(tasks) { task in
                            Text(task.title ?? "Untitled")
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }.onDelete(perform: deleteTasks)
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
                            self.showMenu.toggle()
                        } label: {
                            if(showMenu){
                                Image(systemName: "xmark")
                                    .font(.title)
                                    .foregroundColor(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00)))
                            }else{
                                Image(systemName: "text.justify")
                                    .font(.title)
                                    .foregroundColor(Color(UIColor(red: 0.12, green: 0.64, blue: 0.27, alpha: 1.00) ))
                            }
                            
                        }
                        .padding(.trailing)
                    }
                }
            }
        
        
        
        
    
        }
    
    private func saveContext(){
        withAnimation(){
            do{
                try viewContext.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved Error: \(error)")
            }
        }
      
    }
        
//    //function used in another section
//    private func addResoult(){
//        let newResoult = Task(context: viewContext)
//        newResoult.title = "\(String(Shared.shared.MyPoints ?? 0)) + \(Date())"
//        newResoult.date = Date()
//            //save data
//        saveContext()
//
//    }
    
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map{tasks[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
        

    
    private func updateTask(_ task: FetchedResults<Task>.Element){
        withAnimation{
            task.title = "My Score: \(String(Shared.shared.MyPoints ?? 0)) \(Date().formatted(date: .numeric, time: .shortened))"
            saveContext()
        }
    }
    
    
    func observeCoordinateUpdates() {
        deviceLocationService.coordinatesPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { coordinates in
                self.coordinates = (coordinates.latitude, coordinates.longitude)
            }
            .store(in: &tokens)
    }

    func observeDeniedLocationAccess() {
        deviceLocationService.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                print("Handle access denied event, possibly with an alert.")
            }
            .store(in: &tokens)
    }
    
//    func synhronizeLocation(){
//
//        let group = DispatchGroup()
//
//        group.enter()
//
//
//        DispatchQueue.global(qos: .default).async {
//            observeCoordinateUpdates()
//            observeDeniedLocationAccess()
//            deviceLocationService.requestLocationUpdates()
//               group.leave()
//           }
//
//        group.wait()
//
//            lat = coordinates.lat
//            long = coordinates.lon
//
//    }
//
        
        
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
