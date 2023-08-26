//
//  AudioRecognizable.swift
//  duck
//
//  Created by Felipe Passos on 25/08/23.
//

import Foundation

protocol AudioRecognizable {
    var text: String { get set }
    
    func recognize() throws
}
