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
            icon: "🍎",
            words: ["apple", "apples"],
            type: .nouns,
            theme: allThemes
        ),
        ElementModel(
            icon: "🚶‍♂️",
            words: ["walk", "walking", "walked"],
            type: .verbs,
            theme: allThemes
        ),
        ElementModel(
            icon: "👥",
            words: ["friend", "friends"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "👔",
            words: ["boss"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "📋",
            words: ["manager", "managers"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "👩‍💼",
            words: ["coworker", "coworkers"],
            type: .characters,
            theme: ["work"]
        ),
        ElementModel(
            icon: "💬",
            words: ["talk", "talking", "talked"],
            type: .verbs,
            theme: ["work"]
        ),
        ElementModel(
            icon: "🗣",
            words: ["speak", "speaking", "spoke"],
            type: .verbs,
            theme: ["work"]
        ),
        ElementModel(
            icon: "🤲",
            words: ["put", "putting"],
            type: .verbs,
            theme: ["work"]
        ),
        ElementModel(
            icon: "➕",
            words: ["add", "adding", "added"],
            type: .verbs,
            theme: ["work"]
        ),
        ElementModel(
            icon: "📈",
            words: ["promotion", "promotions"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "🏢",
            words: ["office", "offices"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "☕️",
            words: ["coffee", "coffees"],
            type: .nouns,
            theme: ["work"]
        ),
        ElementModel(
            icon: "📎",
            words: ["stapler", "staplers"],
            type: .nouns,
            theme: ["work"]
        ),
    ]

}
