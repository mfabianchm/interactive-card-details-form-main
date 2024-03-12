//
//  ExpDateInput.swift
//  interactive-card-details-form-main
//
//  Created by Marcos Fabian Chong Megchun on 11/03/24.
//

import SwiftUI

struct ExpDateInput: View {
    
    @ObservedObject var data: expDateData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("EXP. DATE (MM/YY)")
                .foregroundColor(Color("Very-dark-violet"))
            HStack {
                TextField("MM", text: $data.month)
                    .onChange(of: data.month) { newValue in
                        if(newValue == "") {
                            data.monthChanged = false
                        }
                        var lastCharacter = Int(newValue.suffix(1)) ?? nil
                        if (lastCharacter == nil) {
                            let newString = String(newValue.dropLast())
                            data.month = newString
                        } else {
                            data.monthChanged = true
                            data.month = String(newValue.prefix(2))
                        }
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Light-grayish-violet"), lineWidth: 0.5)
                    )
                TextField("YY", text: $data.year)
                    .onChange(of: data.year) { newValue in
                    if(newValue == "") {
                        data.yearChanged = false
                    }
                    var lastCharacter = Int(newValue.suffix(1)) ?? nil
                    if (lastCharacter == nil) {
                        let newString = String(newValue.dropLast())
                        data.year = newString
                    } else {
                        data.yearChanged = true
                        data.year = String(newValue.prefix(2))
                    }
                }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color("Light-grayish-violet"), lineWidth: 0.5)
                    )
            }
            Text(data.errorMsgExpDate)
                .foregroundColor(Color("Red"))
                .opacity(data.expDateIsBlank ? 1 : 0)
                .padding(.bottom, 1)
            
        }
    }
}

//struct ExpDateInput_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpDateInput()
//    }
//}
