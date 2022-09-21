//
//  ContentView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(
        entity: CardInfo.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CardInfo.name,ascending: true)]
    )
    private var cardInfo: FetchedResults<CardInfo>
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var viewMode: Bool = true// Default
    
    
    @State private var isShowAddInfo = false
    @State private var isShowInfoView = false
    @State private var isShowEditView = false
    
    var body: some View {
        NavigationView{
            VStack{
                if viewMode == false {
                    Text("Edit Mode")
                }
                List {
                    ForEach(self.cardInfo) { item in
                        Button(action:{
                            if viewMode == false {// Default
                                isShowEditView = true
                            } else {// Edit
                                isShowInfoView = true
                            }
                        }){
                            if (item.name?.isEmpty) == false {
                                Text(item.name!)
                            }// if
                        }
                        .sheet(isPresented: self.$isShowInfoView, content: {
                            ShowInfoView(name: item.name!, number: item.number!, gt: item.gt!, ccv: item.ccv!)
                                .environment(\.managedObjectContext, viewContext)
                        })
                        .sheet(isPresented: self.$isShowEditView, content: {
                            EditView(name: item.name!, number: item.number!, gt: item.gt!, ccv: item.ccv!)
                                .environment(\.managedObjectContext, viewContext)
                        })
                    }.onDelete(perform:removeData)// ForEach
                }// List
                .navigationTitle("Card Info")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {// Edit
                    if viewMode == true {// Def
                        self.isShowAddInfo.toggle()
                    } else {
                        viewMode = true
                    }
                }) {
                    if viewMode == true {
                        Image(systemName: "square.and.pencil")
                    } else {
                        Text("Done")
                    }
                }
                    .sheet(isPresented: $isShowAddInfo,content: {
                        AddInfoView(name: "", number: "", gt: "", ccv: "")
                            .environment(\.managedObjectContext, viewContext)
                    }))
                .navigationBarItems(leading: Button(action: {
                    viewMode.toggle()
                }){
                    if viewMode == true {
                        Image(systemName: "pencil.slash")
                    }
                })
            }// VStack
        }// NavigationView
    }// body
    private func removeData(at offsets: IndexSet) {
        for index in offsets {
            let putTask = cardInfo[index]
            viewContext.delete(putTask)
        }
        do {
            try self.viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }// removeData
}// View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("Main View")
    }
}
