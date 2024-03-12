//
//  CardNumberInput.swift
//  interactive-card-details-form-main
//
//  Created by Marcos Fabian Chong Megchun on 11/03/24.
//

import SwiftUI

struct CardNumberInput: View {
    
    @ObservedObject var data: cardNumberData
    
    func getSubstrings (start: Int, end: Int) -> String {
        let start = data.card_number.index(data.card_number.startIndex, offsetBy: start)
        let end = data.card_number.index(data.card_number.startIndex, offsetBy: end)
        let range = start...end
        let newString = String(data.card_number[range])
        return newString
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CARD NUMBER")
                .foregroundColor(Color("Very-dark-violet"))
            TextField("e.g. 1234 5678 9123 0000", text: $data.card_number)
                .onChange(of: data.card_number) { newValue in
                    if(newValue == "" && data.cardNumberChanged) {
                        data.cardNumberChanged = false
                    }
                    var lastCharacter = Int(newValue.suffix(1)) ?? nil
                    if (lastCharacter == nil) {
                        let newString = String(newValue.dropLast())
                        data.card_number = newString
                        data.errorMsgCardNumber = "Wrong format, numbers only"
                        data.cardNumberHasText = true
                    } else {
                        data.cardNumberHasText = false
                        data.cardNumberChanged = true
                        data.card_number = String(newValue.prefix(16))
                        if(data.card_number.count < 5) {
                            data.secondSubstring = ""
                            data.firstSubstring = getSubstrings(start: 0, end: data.card_number.count - 1)
                        } else if (data.card_number.count < 9) {
                            data.thirdSubstring = ""
                            data.secondSubstring = getSubstrings(start: 4, end: data.card_number.count - 1)
                        }
                        else if (data.card_number.count < 13) {
                            data.fourthSubstring = ""
                            data.thirdSubstring = getSubstrings(start: 8, end: data.card_number.count - 1)
                        } else if (data.card_number.count < 17) {
                            data.fourthSubstring = getSubstrings(start: 12, end: data.card_number.count - 1)
                        }
                    }
                }
                .keyboardType(UIKeyboardType.phonePad)
                .lineLimit(2)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color("Light-grayish-violet"), lineWidth: 0.5)
                )
            Text(data.errorMsgCardNumber)
                .foregroundColor(Color("Red"))
                .opacity(data.cardNumberHasText ? 1 : 0)
                .padding(.bottom, 1)
        }
    }
}

//struct CardNumberInput_Previews: PreviewProvider {
//    static var previews: some View {
//        CardNumberInput()
//    }
//}
