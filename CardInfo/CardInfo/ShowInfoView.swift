//
//  showInfoView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/13.
//

import SwiftUI


struct ShowInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    
    var cardInfo: FetchedResults<CardInfo>!
    var item: CardInfo!
    
    var name: String!
    var number: String!
    var gt: String!
    var ccv: String!
    
    @State var showAddView: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section{
                        Text(self.name)
                    } header: {
                        Text("Card Name")
                    }
                    Section{
                        Text(self.number)
                    } header: {
                        Text("Card Number")
                    }
                    Section {
                        Text(self.gt)
                    } header: {
                        Text("Good Thru")
                    }
                    Section{
                        Text(self.ccv)
                    } header: {
                        Text("CCV")
                    }
                }
                .listStyle(.insetGrouped)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Done")
                })
                .navigationBarItems(leading: Button(action: {// Edit
                    showAddView.toggle()
                    self.deleteData(item: item)
                }) {
                    Image(systemName: "pencil.slash")
                }
                    .sheet(isPresented: $showAddView, content: {
                        AddInfoView(name: self.name, number: self.number, gt: self.gt, ccv: self.ccv)
                            .environment(\.viewMode, false)// EditMode
                    }))
                
            }// VStack
        }// Navigation
    }// View
    func deleteData(item: CardInfo) {
        viewContext.delete(item)
        do {
            try viewContext.save()
        } catch {
            fatalError("Cannnot save")
        }
    }// func
}// struct

struct showInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShowInfoView(name: "AMEX", number: "1234 1234 1234 1234", gt: "06/2023", ccv: "111")
    }
}
