//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by roman on 26.06.2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack{
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer().frame(height: 60)
                
                Label("Scanner barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
                 
            }
            .navigationTitle("Barcode scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
