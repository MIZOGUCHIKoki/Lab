//
//  AddInfoView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/13.
//

import SwiftUI
import Combine
struct AddInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    @State var name: String = ""
    @State var number: String = ""
    @State var gt: String = ""
    @State var ccv: String = ""
    
    @FocusState var isActive:Bool
    
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
//            .navigationTitle("Input Card")
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
                presentationMode.wrappedValue.dismiss()
            }){
                Image(systemName: "xmark")
            })
        }// NavigationView
    }// body
    
    func saveData() {
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
        presentationMode.wrappedValue.dismiss()
    }// saveData
   
}// View

struct AddInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoView()
    }
}
