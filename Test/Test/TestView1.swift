//
//  TestView1.swift
//  MyCoreData
//
//  Created by 溝口洸熙 on 2022/09/16.
//

import SwiftUI

struct TestView1: View {
    @Environment(\.managedObjectContext) private var contextTest
    
    @FetchRequest(
        entity: Student.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.sid, ascending: true)],
        predicate: nil,
        animation: .default
    )private var studentData: FetchedResults<Student>
    var body: some View {
        List {
            ForEach(studentData, id: \.self) { item in
                Section(header: HStack {
                    Text("\(item.sid!)")
                    Text("\(item.name!)")
                }){
                    VStack(alignment: .leading){
                        Text("生年月日：\(item.birthday!, style: Text.DateStyle.date)")
                        Text("欠席日数：\(item.absentDays)")
                        Text("クラス：\(item.nameOfClass!)")
                        Text("部活：\(item.club!)")
                    }
                }
            }
        }.onAppear {
            registSampleData(context: contextTest)
        }
    }
}

struct TestView1_Previews: PreviewProvider {
    static var previews: some View {
        TestView1()
    }
}
