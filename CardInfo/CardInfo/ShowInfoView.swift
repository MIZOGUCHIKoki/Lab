//
//  showInfoView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/13.
//

import SwiftUI

struct ShowInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    var name: String!
    var number: String!
    var gt: String!
    var ccv: String!
    
    @State private var showAddView: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List{
                    Section{
                        HStack{
                            Button(action: {
                                UIPasteboard.general.string = self.name
                            }){
                                Text(self.name)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.gray)
                            
                        }
                    } header: {
                        Text("Card Name")
                    }
                    Section{
                        HStack{
                            Button(action: {
                                UIPasteboard.general.string = self.number
                            }){
                                Text(self.number)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.gray)
                            
                        }
                    } header: {
                        Text("Card Number")
                    }
                    Section {
                        HStack{
                            Button(action: {
                                UIPasteboard.general.string = self.gt
                            }){
                                Text(self.gt)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.gray)
                            
                        }
                    } header: {
                        Text("Good Thru")
                    }
                    Section{
                        HStack{
                            Button(action: {
                                UIPasteboard.general.string = self.ccv
                            }){
                                Text(self.ccv)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.gray)
                            
                        }
                    } header: {
                        Text("CCV")
                    }
                }
                .listStyle(.insetGrouped)
                .navigationBarItems(trailing: Button(action: {
                    dismiss()
                }){
                    Text("Done")
                })
            }// VStack
        }// Navigation
    }// View
    private func deleteData(item: CardInfo) {
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
