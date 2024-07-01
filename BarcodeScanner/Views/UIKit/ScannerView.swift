//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by roman on 01.07.2024.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannedView: self)
    }
    
    
    final class Coordinator: NSObject,ScannerVCDelegate {
        
        private let scannedView: ScannerView
        
        init(scannedView: ScannerView) {
            self.scannedView = scannedView
        }
        
        func didFind(barcode: String) {
            scannedView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannedView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannedView.alertItem = AlertContext.invalidBarcodeInput
            }
        }
        
        
    }
    

    
   
}
