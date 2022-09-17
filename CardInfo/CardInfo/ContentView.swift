//
//  ContentView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
import CoreData

struct ContentView: View {// MainView
    // showingModalはContentViewで管理する値型のデータ
    @State private var showingModal = false
    let AIV: AddInfoView = AddInfoView()
    
    @FetchRequest(
        entity: CardInfo.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CardInfo.name,ascending: true)]
    )
    var cardInfo: FetchedResults<CardInfo>
    
    @State var viewContext: managedObjectContext = .inactive
    
    @State var searchKey: String = ""
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
                            ShowInfoView(name: item.name!, number: item.number!, gt: item.gt!, ccv: item.ccv!)
                        })
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
                        AIV
                    }))
                .navigationBarItems(leading: Button(action: {// Edit
                    
                }){
                    Image(systemName: "pencil.slash")
                })
            }// VStack
        }// NavigationView
    }// body
    func removeData(at offsets: IndexSet) {
        for index in offsets {
            let putInfo = ContentView().cardInfo[index]
            self.viewContext.delete(putInfo)
        }
        do {
            try self.viewContext.save()
        } catch {
          let nsError = error as NSError
          fatalError("保存 error \(nsError), \(nsError.userInfo)")
        }
    }
}// View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
