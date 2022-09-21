//
//  EditView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/21.
//

import SwiftUI

struct EditView: View {
    
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
            
            .navigationTitle("Add Info")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                if  self.name.isEmpty == false &&
                        self.number.isEmpty == false &&
                        self.gt.isEmpty == false &&
                        self.ccv.isEmpty == false {
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
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(name: "", number: "", gt: "", ccv: "")
    }
}
