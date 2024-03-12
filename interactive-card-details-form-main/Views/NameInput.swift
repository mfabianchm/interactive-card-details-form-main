//
//  NameInput.swift
//  interactive-card-details-form-main
//
//  Created by Marcos Fabian Chong Megchun on 08/03/24.
//

import SwiftUI

struct NameInput: View {
    
    @ObservedObject var data: inputNameData
    let decimalCharacters = CharacterSet.decimalDigits
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CARDHOLDER NAME")
                .foregroundColor(Color("Very-dark-violet"))
            TextField("e.g. Jane Appleseed", text: $data.name)
                .onChange(of: data.name) { newValue in
                    let decimalRange = newValue.rangeOfCharacter(from: decimalCharacters)
                    if decimalRange != nil {
                        data.errorMsgName = "Wrong format, text only"
                        data.nameHasNumber = true
                        return
                    } else {
                        data.nameHasNumber = false
                    }
                    
                    if(data.name == "" && data.nameChanged) {
                        data.nameChanged = false
                        return
                    }
                    if(!data.nameChanged) {
                        data.nameChanged = true
                    }
                    data.name = newValue
                            }
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("Light-grayish-violet"), lineWidth: 0.5)
                )
            Text(data.errorMsgName)
                    .foregroundColor(Color("Red"))
                    .opacity(data.nameHasNumber ? 1 : 0)
                    .padding(.bottom, 1)
        }
    }
}

struct NameInput_Previews: PreviewProvider {
    static var previews: some View {
        var nameData = inputNameData()
        NameInput(data: nameData)
    }
}
