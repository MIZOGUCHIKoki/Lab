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
    
    @State var name: String = ""
    @State var number: String = ""
    @State var gt: String = ""
    @State var ccv: String = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    TextField("Card name", text: $name,onCommit: {})
                    TextField("Card number", text: $number, onCommit: {})
                        .keyboardType(.numberPad)
                    TextField("Good Thru (mm/yyyy)",text: $gt, onCommit: {})
                        .keyboardType(.numberPad)
                    TextField("CCV", text: $ccv, onCommit: {})
                        .keyboardType(.numberPad)
                }// List
            }// VStack
            .navigationTitle("Add Card")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                saveData()
            }){
                Text("Done")
            })
        }// NavigationView
    }// body
    
    private func saveData() {
        presentationMode.wrappedValue.dismiss()
    }
}// View

struct AddInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoView()
    }
}
