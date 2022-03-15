//
//  XmarkButton.swift
//  CryptoTracker
//
//  Created by Tyler Aguirre on 3/10/22.
//

import SwiftUI

struct XmarkButton: View {

    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}
//
//struct XmarkButton_Previews: PreviewProvider {
//    static var previews: some View {
//        XmarkButton(presentationMode: )
//    }
//}
