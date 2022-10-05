//
//  TaskViewModel.swift
//  MVVM
//
//  Created by Jakub Chodara on 05/10/2022.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    @Published var storedTasks: [Task1] = [
        Task1(taskTitle: "Start of rejestration", taskDescription: "Our IRK system is starting working that day ", taskDate: .init(timeIntervalSince1970: 1646089200)),
        Task1(taskTitle: "End of rejestrtion", taskDescription: "Our IRK system is closeing that day", taskDate: .init(timeIntervalSince1970: 1689026400)),
        Task1(taskTitle: "Start of PE exams", taskDescription: "Bring formula from your doc that confirm you can participate", taskDate: .init(timeIntervalSince1970: 1689026400)),
        Task1(taskTitle: "End of PE exams", taskDescription: "We hope you succseed", taskDate: .init(timeIntervalSince1970: 1689372000)),
        Task1(taskTitle: "Start Matura", taskDescription: "First day that you can bring matura for us", taskDate: .init(timeIntervalSince1970: 1689026400)),
        Task1(taskTitle: "Finish Matura", taskDescription: "Last day that you can bring matura for us", taskDate: .init(timeIntervalSince1970: 1689372000)),
        Task1(taskTitle: "Resoults", taskDescription: "That day you can look at you IRK account and check if you succseed", taskDate: .init(timeIntervalSince1970: 1689631200)),
    ]
    
    //Curr week days
    @Published var currentWeek: [Date] = []
    
    @Published var curentDay: Date = Date()
    
    
    @Published var filterredTasks: [Task1]?
    
    @Published var nofilterredTasks: [Task1]?
    
    init(){
        fetchCurrentWeek()
        filterTodayTask()
    }
    
    func filterTodayTask(){
        DispatchQueue.global(qos: .userInitiated).async {
            
            let calendar = Calendar.current
            
            let filterred = self.storedTasks.filter{
                return calendar.isDate($0.taskDate, inSameDayAs: self.curentDay)
            }.sorted{ task1, task2 in
                return task2.taskDate < task1.taskDate
            }
            
            DispatchQueue.main.async {
                withAnimation{
                    self.filterredTasks = filterred
                }
            }
            
        }
    }
    
    func allTasks(){
        let calendar = Calendar.current
        
        let nofilterred = self.storedTasks
        
        self.nofilterredTasks = nofilterred
    }
    
    
    
    func fetchCurrentWeek(){
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (1...7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
        
    }
    
    
    func extractDate(date: Date, format: String)->String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    
    func isTtoday(date: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(curentDay, inSameDayAs: date)
    }
    
    func isCurrentHour(date: Date)->Bool{
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        return hour == currentHour
    }
}
