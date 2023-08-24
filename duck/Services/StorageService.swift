//
//  StorageService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation
import SwiftUI

struct StorageService {
    @AppStorage("isFirstLogin") static var isFirstLogin = false
}
