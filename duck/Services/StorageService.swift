//
//  StorageService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation
import SwiftUI

/// A service responsible for managing storage-related operations, particularly those
/// related to user preferences and settings.
///
/// This struct provides an encapsulated way to access and modify specific user-related
/// settings using SwiftUI's `AppStorage` property wrapper, which automatically synchronizes
/// with the user defaults system.
struct StorageService {

    /// Represents whether it's the user's first login.
    ///
    /// This property uses the `AppStorage` property wrapper to automatically read from and write to
    /// the user defaults system. Whenever the value changes, the corresponding value in user defaults
    /// is automatically updated.
    @AppStorage("isFirstLogin") static var isFirstLogin = false
}

