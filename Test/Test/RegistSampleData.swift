//
//  RegistSampleData.swift
//  MyCoreData
//
//  Created by 溝口洸熙 on 2022/09/16.
//

import Foundation
import CoreData

func registSampleData(context: NSManagedObjectContext) {
    // Data of student
    let studentList = [
        ["001", "カピバラ", "2010/04/16", "3", "A", "バスケット"],
        ["002", "アライグマ", "2011/02/06", "0", "B", "サッカー"],
        ["003", "カイウサギ", "2010/04/08", "10", "B", ""],
        ["004", "ハクビシン", "2010/12/21", "7", "A", "吹奏楽"],
        ["005", "ワオキツネザル", "2010/9/20", "5", "A", "サッカー"]
    ]
    
    // Delete data of list
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    fetchRequest.entity = Student.entity()
    let students = try? context.fetch(fetchRequest) as? [Student]
    for item in students! {
        context.delete(item)
    }
    let dateFomatter = DateFormatter()
    dateFomatter.dateFormat = "yyyy/M/d"
    
    // Regist data
    for item in studentList {
        let newStudent = Student(context: context)
        newStudent.sid = item[0]
        newStudent.name = item[1]
        newStudent.birthday = dateFomatter.date(from: item[2])!
        newStudent.absentDays = Int16(item[3])!
        newStudent.nameOfClass = item[4]
        newStudent.club = item[5]
    }
    
    try? context.save()
}
