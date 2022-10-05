//
//  Home.swift
//  MVVM
//
//  Created by Jakub Chodara on 05/10/2022.
//

import SwiftUI

struct Home: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    var body: some View {
       
        ScrollView(.vertical, showsIndicators: false){
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]){
                Section{
                    //Current week view
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(taskModel.currentWeek, id: \.self){ day in
                                VStack(spacing: 10){
                                    Text(taskModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    Text(taskModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 14))
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskModel.isTtoday(date: day) ? 1 : 0)
                                    
                                }
                                .foregroundStyle(taskModel.isTtoday(date: day) ? .primary : .secondary)
                                .foregroundColor(taskModel.isTtoday(date: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack{
                                        if taskModel.isTtoday(date: day){
                                            Capsule()
                                                .fill(.black)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                
                                .clipShape(Capsule())
                                .onTapGesture {
                                    //SetCurrDay
                                    withAnimation{
                                        taskModel.curentDay = day
                                    }
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                    }
                    TaskView()
                    //AllTasksView()
                } header: {
                    HeaderView()
                        .ignoresSafeArea()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
    
    //TaskView
    
    func AllTasksView()->some View{
        VStack{
            let tasks = taskModel.storedTasks
            
                    ForEach(tasks){Task in
                        Text(String(Task.taskTitle))
                        Text(String(Task.taskDescription))
                        Text(String(Task.taskDate.formatted(date: .numeric, time: .shortened)))
            }
        }
    }
    
    func TaskView()->some View{
        LazyVStack(spacing: 18){
            if let tasks = taskModel.filterredTasks{
                
                if tasks.isEmpty{
                    Text("No tasks Found!!!!")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                        .offset(y: 100)
                }else{
                    ForEach(tasks){ task in
                        TaskCardView(task: task)
                    }
                }
            }else{
                ProgressView()
                    .offset(y: 100)
            }
        }
        .padding()
        .padding(.top)
        .onChange(of: taskModel.curentDay){newValue in
            taskModel.filterTodayTask()
        }
    }
    
   
    func TaskCardView(task: Task1)->some View{
        
        HStack(alignment: .top, spacing: 30){
            VStack(spacing: 10) {
               Circle()
                    .fill(taskModel.isCurrentHour(date: task.taskDate) ? .black : .clear)
                    .frame(width: 15, height: 15)
                    .background(
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .padding(-3)
                    )
                    .scaleEffect(taskModel.isCurrentHour(date: task.taskDate) ? 0.8 : 1)
                    Rectangle()
                    .fill(.black)
                    .frame(width: 3)
            }
            
            VStack{
                HStack(alignment: .top, spacing: 10){
                    VStack(alignment: .leading, spacing: 12){
                        Text(task.taskTitle)
                            .font(.title2.bold())
                        Text(task.taskDescription)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                    }
                    .hLeading()
                    Text(task.taskDate.formatted(date: .omitted, time: .shortened))

                    
                }
                
                if taskModel.isCurrentHour(date:  task.taskDate){
                    HStack(spacing: 0){
                        HStack(spacing: -10){
                            ForEach(["person.circle", "person.circle.fill", "person"], id: \.self){user in
                                Image(systemName: user)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                    .background(
                                    Circle()
                                    //frame
                                        .stroke(.white, lineWidth: 5)
                                    )
                            }
                        }
                        .hLeading()
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "checkmark")
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.white, in: RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.top)
                }
            }
            .foregroundColor(taskModel.isCurrentHour(date: task.taskDate) ? .white : .black)
            .padding(taskModel.isCurrentHour(date: task.taskDate) ? 15 : 0)
            .padding(.bottom, taskModel.isCurrentHour(date: task.taskDate) ? 0 : 10)
            .hLeading()
            .background(
                Color.black
                    .cornerRadius(25)
                    .opacity(taskModel.isCurrentHour(date: task.taskDate) ? 1 : 0)
                
            )
            
        }
        .hLeading()
    }
    
    
    //Header
    func HeaderView()->some View{
        HStack(spacing: 10){
            VStack {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(.gray)
                Text("Today")
                    .font(.largeTitle.bold())
            }
            .hLeading()
            
            Button{
                
            } label: {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(Color.white)
       
    }

        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


    //UIDesignHelperFunction
extension View{
    
    func hLeading()-> some View{
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing()->some View{
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter()-> some View{
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
    

}

