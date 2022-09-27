//
//  EditView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/21.
//

import SwiftUI

struct EditView: View {
    var cardInfo: FetchedResults<CardInfo>
    var item: CardInfo
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var name: String
    @State var number: String
    @State var gt: String
    @State var ccv: String
    
    @FocusState private var isActive:Bool
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    TextField("Card name", text: $name,onCommit: {})
                        .focused($isActive)
                        .toolbar{
                            ToolbarItemGroup(placement: .keyboard){
                                Spacer()
                                Button("Done"){
                                    self.isActive = false
                                }
                            }
                        }
                    TextField("Card number", text: $number, onCommit: {self.isActive = false})
                        .keyboardType(.numberPad)
                        .focused($isActive)
                    TextField("GOOD THRU (mm/yyyy)",text: $gt, onCommit: {self.isActive = false})
                        .keyboardType(.numberPad)
                        .focused($isActive)
                    TextField("CCV", text: $ccv, onCommit: {self.isActive = false})
                        .keyboardType(.numberPad)
                        .focused($isActive)
                }// List
            }// VStack
            
            .navigationTitle("Edit Info")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                if  self.name.isEmpty == false &&
                        self.number.isEmpty == false &&
                        self.gt.isEmpty == false &&
                        self.ccv.isEmpty == false {
                    self.saveData()
                } else {
                    self.showingAlert = true
                }
            }){
                Image(systemName: "square.and.arrow.down")
            }.alert("There are blanks", isPresented: $showingAlert, actions: {}))
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }){
                Image(systemName: "xmark")
            })
        }// NavigationView
    }// body
    private func saveData() {
        let newCardInfo = CardInfo(context: viewContext)
        newCardInfo.name = self.name
        newCardInfo.number = self.number
        newCardInfo.gt = self.gt
        newCardInfo.ccv = self.ccv
        do {
            try viewContext.save()
        } catch {
            
            fatalError("Cannot save")
        }
        self.name = ""
        self.number = ""
        self.gt = ""
        self.ccv = ""
        dismiss()
    }// saveData
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
////        EditView(name: "", number: "", gt: "", ccv: "",cardInfo: nil)
//    }
//}
