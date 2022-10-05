//
//  Task.swift
//  MVVM
//
//  Created by Jakub Chodara on 05/10/2022.
//

import SwiftUI

//This is my task model

struct Task1: Identifiable{
    var id =  UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
