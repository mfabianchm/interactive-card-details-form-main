//
//  SuccessPage.swift
//  interactive-card-details-form-main
//
//  Created by Marcos Fabian Chong Megchun on 11/03/24.
//

import SwiftUI

struct SuccessPage: View {
    @Binding var everythingOk: Bool
    @ObservedObject var expirationData: expDateData
    @ObservedObject var nameData: inputNameData
    @ObservedObject var cardNumData: cardNumberData
    @ObservedObject var cvcData: CvcData
    
    var body: some View {
        VStack {
            Image("icon-complete")
                .padding(.bottom, 20)
            Text("THANK YOU!")
                .font(.custom("SpaceGrotesk-Medium", size: 30))
                .foregroundColor(Color("Very-dark-violet"))
                .padding(.bottom, 1)
            Text("We've added your card details")
                .foregroundColor(Color("Light-grayish-violet"))
            Button(action: {
                everythingOk = false
                resetFields()
            }) {
                Text("Continue")
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 7)
                    }
            }
            .tint(Color("Very-dark-violet"))
            .padding(.top, 10)
        }
        .font(.custom("SpaceGrotesk-Medium", size: 15))
        .padding(20)
        .frame(maxWidth: .infinity)
        .offset(y: 60)
        Spacer(minLength: 90)
    }
    
    func resetFields() -> Void {
        nameData.name = ""
        nameData.errorMsgName = ""
        nameData.nameHasNumber = false
        nameData.nameChanged = false
        
        cardNumData.card_number = ""
        cardNumData.cardNumberChanged = false
        cardNumData.errorMsgCardNumber = ""
        cardNumData.cardNumberHasText = false
        cardNumData.firstSubstring = ""
        cardNumData.secondSubstring = ""
        cardNumData.thirdSubstring = ""
        cardNumData.fourthSubstring = ""
        
        expirationData.month = ""
        expirationData.monthChanged = false
        expirationData.year = ""
        expirationData.yearChanged = false
        expirationData.errorMsgExpDate = ""
        expirationData.expDateIsBlank = false
        
        cvcData.cvc = ""
        cvcData.cvcChanged = false
        cvcData.errorMsgCvc = ""
        cvcData.cvcIsBlank = false
        
    }
}



//struct SuccessPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SuccessPage()
//    }
//}
