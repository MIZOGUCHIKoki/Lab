//
//  ContentView.swift
//  CreditCard
//
//  Created by 溝口洸熙 on 2022/09/09.
//

import SwiftUI
import Foundation



struct ContentView: View {
    @ObservedObject var int: InputJson = InputJson()
    
    
    var body: some View {
//        int.inputJson()
        NavigationView {
            VStack{
                List{
                }
            }// VStack
            .navigationBarItems(trailing: NavigationLink( destination:CardEditView()){
                HStack{
                    Image(systemName: "pencil.slash")
                }// HStack
            }// NavigationLink
            )}// NavigationView
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("iPhone 12")
        }
    }
}


