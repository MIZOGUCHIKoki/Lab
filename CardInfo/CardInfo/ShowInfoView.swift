//
//  showInfoView.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/13.
//

import SwiftUI


struct ShowInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    let name: String
    let number: String
    let gt: String
    let ccv: String
    
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
            }
        }
    }
}

struct showInfoView_Previews: PreviewProvider {
    static var previews: some View {
//        ShowInfoView()
        ShowInfoView(name: "AMEX", number: "1234 1234 1234 1234", gt: "06/2023", ccv: "111")
    }
}
