//
//  Test.swift
//  CardInfo
//
//  Created by 溝口洸熙 on 2022/09/13.
//

import SwiftUI

struct Test: View {
    @State var isPresentedSubView = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.isPresentedSubView.toggle()
            }) {
                Text("モーダル画面を表示")
            }
            .sheet(isPresented: $isPresentedSubView) {
                SubView()
            }
        }
    }
}
struct SubView: View {
    @Environment(\.presentationMode) private var presentationMode
       var body: some View {
           Button("Close ModalView.") {
               self.presentationMode.wrappedValue.dismiss()
           }
       }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
