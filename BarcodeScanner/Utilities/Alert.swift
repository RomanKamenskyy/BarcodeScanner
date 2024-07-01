//
//  Alert.swift
//  BarcodeScanner
//
//  Created by roman on 02.07.2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "invalid Device Input",
                                              message: "Something wrong with camera",
                                              dismissButton: .default(Text("OK")))
    static let invalidBarcodeInput = AlertItem(title: "invalid Barcode Input",
                                              message: "Something wrong with barcode",
                                              dismissButton: .default(Text("OK")))
}
