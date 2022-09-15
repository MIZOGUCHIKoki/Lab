//
//  ContentView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
import CoreData

struct ContentView: View {// MainView
    
    @Environment(\.managedObjectContext) var viewContext
    
    
    // showingModalはContentViewで管理する値型のデータ
    @State private var showingModal = false
    
    @FetchRequest(sortDescriptors: [])
    var cardInfo: FetchedResults<CardInfo>
    
    @State var searchKey: String = ""
    @State var isShowAddInfo = false
    @State var isShowInfoView = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(cardInfo) { item in
                        Button(action:{
                            
                        }){
                            if (item.name?.isEmpty) == false {
                                Text(item.name!)
                            }// if
                        }
                        .sheet(isPresented: self.$isShowInfoView, content: {
//                            ShowInfoView(name: item.name!, number: item.number!, gt: item.gt!, ccv: item.ccv!)
                        })
                    }// ForEach
                }// List
                
                .navigationTitle("CardInfo")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    self.isShowAddInfo.toggle()
                }) {
                    Image(systemName: "square.and.pencil")
                }
                    .sheet(isPresented: $isShowAddInfo,content: {
                        AddInfoView()
                    }))
            }// VStack
        }// NavigationView
    }// body
}// View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
