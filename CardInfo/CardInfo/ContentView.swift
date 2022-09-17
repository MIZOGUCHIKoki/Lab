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
    var cardInfo: FetchedResults<CardInfo>
    
    @Environment(\.managedObjectContext) var viewContext
    
    @State var isShowAddInfo = false
    @State var isShowInfoView = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(self.cardInfo) { item in
                        Button(action:{
                            isShowInfoView = true
                        }){
                            if (item.name?.isEmpty) == false {
                                Text(item.name!)
                            }// if
                        }
                        .sheet(isPresented: self.$isShowInfoView, content: {
                            ShowInfoView(cardInfo: cardInfo,item: item, name: item.name!, number: item.number!, gt: item.gt!, ccv: item.ccv!)
                        }).environment(\.managedObjectContext, viewContext)
                    }.onDelete(perform:removeData)// ForEach
                }
                // List
                
                .navigationTitle("CardInfo")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {// Edit
                    self.isShowAddInfo.toggle()
                }) {
                    Image(systemName: "square.and.pencil")
                }
                    .sheet(isPresented: $isShowAddInfo,content: {
                        AddInfoView(name: "", number: "", gt: "", ccv: "")
                            .environment(\.managedObjectContext, viewContext)
                            .environment(\.viewMode, true)
                    }))
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
    }
}
