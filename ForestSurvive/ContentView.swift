//
//  ContentView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    
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
                    Section(header: Text("Your points") ){
                        HStack{
                            Spacer()
                            VStack{
                                Text(String(MyPoints1 ?? 0))
                                    .padding(.top)
                                Button {
                                    MyPoints1 = Shared.shared.MyPoints
                                    addItem()
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
                    Section(header: Text("Set your latitude and longitude") ) {
                        VStack {
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
                            }
                          
                        }
                    }
                    
                    Section(header: Text("DataBase")){
                     
                            List {
                                ForEach(items) { item in
                                    NavigationLink {
                                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                    } label: {
                                        Text(item.timestamp!, formatter: itemFormatter)
                                    }
                                }
                                .onDelete(perform: deleteItems)
                            }
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    //EditButton()
                                }
//                                ToolbarItem {
//                                    Button(action: addItem) {
//                                        Label("Add Item", systemImage: "plus")
//                                    }
//                                }
                            }
                            Text("Select an item")
                        
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
    
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
