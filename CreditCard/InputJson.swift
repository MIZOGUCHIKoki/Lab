//
//  ImputJson.swift
//  CreditCard
//
//  Created by 溝口洸熙 on 2022/09/09.
//

struct CardItem: Identifiable {
    let id = UUID()
    let CardName: String
    let CardBrand: String
}

import Foundation
class InputJson: ObservableObject {
    init(){}
    struct CardDataBase: Codable {
        let CardName: String?
        let CardBrand: String?
        let CardNumber: Int?
        let GoodThru: Int?
        let Nominee: String?
        let SecurityCode: Int?
    }
    
    @Published var CardList: [CardItem] = []
    
    func inputJson() -> () {
        guard let url = Bundle.main.url(forResource: "DataBase", withExtension: "json") else {
            fatalError("ファイルが見つからない")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ファイル読み込みエラー")
        }
        let decoder = JSONDecoder()
        guard let item = try? decoder.decode([CardDataBase].self, from: data) else {
            fatalError("JOSN読み込みエラー")
        }
        for items in item {
            print(items)
        }
    }
}
