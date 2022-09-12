//
//  ContentView.swift
//  Test
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // environmetValueを取り出す
    @Environment(\.managedObjectContext) var viewContext
    
    //データを要求する記述（取得したデータの並び順指定: 指定なし[]）
    @FetchRequest(sortDescriptors: [])
    var humans: FetchedResults<Human>// 取得したデータをHumansに格納＜Entityの名前＞
    
    // 入力フィールド
    @State var name: String = ""
    
    var body: some View {
        VStack{
            TextField("Name",text: $name,onCommit: addHuman)
                .padding()
            Button(action:{
                deleteHuman()
            }){
                Text("DeleteHuman")
                    .padding()
            }
            List {
                ForEach(humans) { item in
                    if(item.name?.isEmpty) == false {
                        HStack{
                            if(item.checked) {
                                Text("🟦")
                            } else {
                                Text("🟥")
                            }
                            Button(action: {
                                item.checked.toggle()
                            }){
                                Text(item.name!)
                            }// Button
                        }// HStack
                    }// if
                }// ForEach
            }// List
        }// VStack
    }// body
    
    func addHuman() {
        // Entity名に基づいて作成
        let newHuman = Human(context: viewContext)
        newHuman.name = name
        do {
            try viewContext.save()
        } catch {
            fatalError("Cannot save")
        }
        name = ""
    }// func:addHuman
    
    func deleteHuman() {
        for item in humans {
            if(item.checked) {
                viewContext.delete(item)
            }
        }
        do {
            try viewContext.save()
        } catch {
            fatalError("Cannnot save")
        }
    }
}// View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
