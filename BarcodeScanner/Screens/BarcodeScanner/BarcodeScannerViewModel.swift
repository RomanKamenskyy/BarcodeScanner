//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by roman on 02.07.2024.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
       return scannedCode.isEmpty ? "Not yet scanned" : scannedCode
    }
    
    var statusTextColor: Color {
       scannedCode.isEmpty ? .red : .green
    }
}
