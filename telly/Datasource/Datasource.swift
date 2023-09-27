//
//  Source.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 29/08/23.
//

import Foundation

class Datasource {
    static let shared = Datasource()
    
    var elements: [ElementModel] = []
    
    init() {
        let allThemes = ["shopping", "traveling", "work"]
        
        let allElements = [
            ElementModel(
                icon: "apple.logo",
                words: ["apple", "apples"],
                type: .nouns,
                theme: allThemes
            ),
            ElementModel(
                icon: "medal.fill",
                words: ["promotion", "promotions"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "building.fill",
                words: ["office", "offices"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "clipboard.fill",
                words: ["clipboard", "clipboards"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "newspaper.fill",
                words: ["newspaper", "newspapers"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "mail",
                words: ["letter", "letters"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "deskclock.fill",
                words: ["meeting", "meetings"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "bitcoinsign.circle.fill",
                words: ["salary", "salaries"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "pencil",
                words: ["pen", "pens"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "arrow.triangle.branch",
                words: ["career", "careers"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "desktopcomputer",
                words: ["computer", "computers"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "studentdesk",
                words: ["desk", "desks"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "book",
                words: ["schedule", "schedules"],
                type: .nouns,
                theme: ["work"]
            ),
            ElementModel(
                icon: "airplane",
                words: ["airplane", "airplanes"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "sailboat.fill",
                words: ["boat", "boats"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "car.fill",
                words: ["car", "cars"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "suitcase.rolling.fill",
                words: ["suitcase", "suitcases"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "ticket",
                words: ["ticket", "tickets"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "h.square.fill",
                words: ["hotel", "hotels"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "phone.fill",
                words: ["phone", "phones"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "fork.knife",
                words: ["food", "foods"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "wallet.pass.fill",
                words: ["wallet", "wallets"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "beach.umbrella.fill",
                words: ["beach", "beaches"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "building.2.fill",
                words: ["city", "cities"],
                type: .nouns,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "dollarsign",
                words: ["money"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "house.lodge",
                words: ["store", "stores"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "door.french.closed",
                words: ["shelf", "shelves"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "tag",
                words: ["tag", "tags"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "basket.fill",
                words: ["basket", "baskets"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "creditcard.fill",
                words: ["credit card", "credit cards"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "arrow.down.to.line",
                words: ["discount", "discounts"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "gift",
                words: ["gift", "gifts"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "plus.forwardslash.minus",
                words: ["receipt", "receipts"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "bitcoinsign.circle",
                words: ["coins"],
                type: .nouns,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "shippingbox",
                words: ["box", "boxes"],
                type: .nouns,
                theme: ["shopping"]
            ),
            
            ElementModel(
                icon: "",
                words: ["speak", "speaking", "spoken"],
                type: .verbs,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["consult", "consulting", "consulted"],
                type: .verbs,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["borrow", "borrowing", "borrowed"],
                type: .verbs,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["arrive", "arriving", "arrived"],
                type: .verbs,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["argue", "arguing", "argued"],
                type: .verbs,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["retire", "retiring", "retired"],
                type: .verbs,
                theme: ["work"]
            ),
            
            ElementModel(
                icon: "",
                words: ["walk", "walking", "walked"],
                type: .verbs,
                theme: ["work", "traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["travel", "traveling", "traveled"],
                type: .verbs,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["delay", "delaying", "delayed"],
                type: .verbs,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["sleep", "sleeping", "slept"],
                type: .verbs,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["decide", "deciding", "decided"],
                type: .verbs,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["carry", "carrying", "carried"],
                type: .verbs,
                theme: ["traveling"]
            ),
            
            ElementModel(
                icon: "",
                words: ["shop", "shopping", "shopped"],
                type: .verbs,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["ask", "asking", "asked"],
                type: .verbs,
                theme: allThemes
            ),
            ElementModel(
                icon: "",
                words: ["talk", "talking", "talked"],
                type: .verbs,
                theme: allThemes
            ),
            ElementModel(
                icon: "",
                words: ["spend", "spending", "spent"],
                type: .verbs,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["waste", "wasting", "wasted"],
                type: .verbs,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["deliver", "delivering", "delivered"],
                type: .verbs,
                theme: ["work", "shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["take", "taking", "took"],
                type: .verbs,
                theme: ["traveling", "shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["put", "putting", "put"],
                type: .verbs,
                theme: ["work", "shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["go", "going", "went"],
                type: .verbs,
                theme: ["traveling", "shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["demand", "demanding", "demanded"],
                type: .verbs,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["add", "adding", "added"],
                type: .verbs,
                theme: ["work", "shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["fit", "fitting", "fit"],
                type: .verbs,
                theme: allThemes
            ),
            ElementModel(
                icon: "",
                words: ["friend", "friends"],
                type: .characters,
                theme: ["work", "shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["boss", "bosses"],
                type: .characters,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["manager", "managers"],
                type: .characters,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["coworker", "coworkers"],
                type: .characters,
                theme: ["work"]
            ),
            ElementModel(
                icon: "",
                words: ["travel agent", "travel agents"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["mom", "moms"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["brother", "brothers"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["sister", "sisters"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["dad", "dads"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["pilot", "pilots"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["grandma", "grandmas"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["grandpa", "grandpas"],
                type: .characters,
                theme: ["traveling"]
            ),
            ElementModel(
                icon: "",
                words: ["salesperson", "salespeople"],
                type: .characters,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["owner", "owners"],
                type: .characters,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["salesman", "salesmen"],
                type: .characters,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["saleswoman", "saleswomen"],
                type: .characters,
                theme: ["shopping"]
            ),
            ElementModel(
                icon: "",
                words: ["manager", "managers"],
                type: .characters,
                theme: ["shopping"]
            )
        ]
        
        for element in allElements {
            var current = element
            current.words.removeAll()
            
            for word in element.words {
                let formmatedWord = word.localized(forLanguageCode: LocaleService.shared.gameLocale)
                current.words.append(formmatedWord)
            }
            
            elements.append(current)
        }
    }
}
