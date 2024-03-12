//
//  CvcInput.swift
//  interactive-card-details-form-main
//
//  Created by Marcos Fabian Chong Megchun on 11/03/24.
//

import SwiftUI

struct CvcInput: View {
    
    @ObservedObject var data: CvcData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CVC")
                .foregroundColor(Color("Very-dark-violet"))
            TextField("CVC", text: $data.cvc)
                .onChange(of: data.cvc) { newValue in
                if(newValue == "") {
                    data.cvcChanged = false
                }
                var lastCharacter = Int(newValue.suffix(1)) ?? nil
                if (lastCharacter == nil) {
                    let newString = String(newValue.dropLast())
                    data.cvc = newString
                } else {
                    data.cvcChanged = true
                    data.cvc = String(newValue.prefix(3))
                }
            }
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("Light-grayish-violet"), lineWidth: 0.5)
                )
            Text(data.errorMsgCvc)
                .foregroundColor(Color("Red"))
                .opacity(data.cvcIsBlank ? 1 : 0)
                .padding(.bottom, 1)
        }
    }
}

//struct CvcInput_Previews: PreviewProvider {
//    static var previews: some View {
//        CvcInput()
//    }
//}
