//
//  ContentView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/12.
//

import SwiftUI
import CoreData


struct AddInfoView: View {
    @State var name: String = ""
    @State var number: Int?
    @State var gt: Int?
    @State var ccv: Int?
    
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    TextField("Card name", text: $name,onCommit: {})
                    TextField("Card number", value: $number, formatter: NumberFormatter(),onCommit: {})
                        .keyboardType(.numberPad)
                    TextField("Good Thru (mmyy)", value: $gt, formatter: NumberFormatter(),onCommit: {})
                        .keyboardType(.numberPad)
                    TextField("CCV", value: $ccv, formatter: NumberFormatter(),onCommit: {})
                        .keyboardType(.numberPad)
                }// List
            }// VStack
            .navigationTitle("Add Card")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView: View {// MainView
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(sortDescriptors: [])
    var cardInfo: FetchedResults<CardInfo>
    
    @State var searchKey: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    TextField("Serach",text: $searchKey,onCommit: search)
                    ForEach(cardInfo) { item in
                        if (item.name?.isEmpty) == false {
                            Text(item.name!)
                        }// if
                    }// ForEach
                }// List
                
                .navigationTitle("CardInfo")
                .navigationBarTitleDisplayMode(.inline)
                //            .navigationBarItems(trailing: Button(action:{
                //
                //            }){
                //                Image(systemName: "square.and.pencil")
                //            })
                
            }// VStack
        }// NavigationView
    }// body
    
    func search(){
    }
    
}// View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        AddInfoView()
    }
}
