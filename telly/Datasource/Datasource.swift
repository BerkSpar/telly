//
//  Source.swift
//  duck
//
//  Created by Heloisa Pereira Machado on 29/08/23.
//

import Foundation

class Datasource {
    static let allThemes = ["shopping", "traveling", "work"]

    static let elements: [ElementModel] = [
        ElementModel(
            icon: "medal.fill",
            words: ["promotion"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "network",
            words: ["office"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "clipboard.fill",
            words: ["clipboard"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "newspaper.fill",
            words: ["newspaper"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "mail",
            words: ["letter"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "deskclock.fill",
            words: ["meeting"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "bitcoinsign.circle.fill",
            words: ["salary"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "pencil",
            words: ["pen"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "arrow.triangle.branch",
            words: ["career"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "desktopcomputer",
            words: ["computer"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "studentdesk",
            words: ["desk"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "book",
            words: ["schedule"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "building.fill",
            words: ["building"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "airplane",
            words: ["airplane"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "sailboat.fill",
            words: ["boat"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "car.fill",
            words: ["car"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "suitcase.rolling.fill",
            words: ["suitcase"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "ticket",
            words: ["ticket"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "h.square.fill",
            words: ["hotel"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "phone.fill",
            words: ["phone"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "carrot.fill",
            words: ["carrot"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "wallet.pass.fill",
            words: ["wallet"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "sailboat.fill",
            words: ["boat"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "beach.umbrella.fill",
            words: ["beach"],
            type: .nouns,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "building.2.fill",
            words: ["city"],
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
            words: ["store"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "door.french.closed",
            words: ["shelf"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "tag",
            words: ["tag"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "basket.fill",
            words: ["basket"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "creditcard.fill",
            words: ["credit card"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "arrow.down.to.line",
            words: ["discount"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "gift",
            words: ["gift"],
            type: .nouns,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "plus.forwardslash.minus",
            words: ["receipt"],
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
            words: ["box"],
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
            words: ["friend"],
            type: .characters,
            theme: ["work", "shopping"]
        ),
        ElementModel(
            icon: "",
            words: ["boss"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "",
            words: ["manager"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "",
            words: ["coworker"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "",
            words: ["travel agent"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["mom"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["brother"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["sister"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["dad"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["pilot"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["grandma"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["grandpa"],
            type: .characters,
            theme: ["traveling"]
        ),
        ElementModel(
            icon: "",
            words: ["salesperson"],
            type: .characters,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "",
            words: ["owner"],
            type: .characters,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "",
            words: ["salesman"],
            type: .characters,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "",
            words: ["saleswoman"],
            type: .characters,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "",
            words: ["manager"],
            type: .characters,
            theme: ["shopping"]
        ),
        ElementModel(
            icon: "",
            words: ["security guard"],
            type: .characters,
            theme: ["shopping"]
        )
        
    ]

}
