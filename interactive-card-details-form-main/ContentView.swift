


import SwiftUI
import Combine

class inputNameData: ObservableObject {
    @Published var name: String = ""
    @Published var errorMsgName: String = ""
    @Published var nameHasNumber: Bool = false
    @Published var nameChanged: Bool = false
}

class cardNumberData: ObservableObject {
    @Published var card_number: String = ""
    @Published var cardNumberChanged: Bool = false
    @Published var errorMsgCardNumber: String = ""
    @Published var cardNumberHasText: Bool = false
    @Published var firstSubstring: String = ""
    @Published var secondSubstring: String = ""
    @Published var thirdSubstring: String = ""
    @Published var fourthSubstring: String = ""
}

class expDateData: ObservableObject {
    @Published var month: String = ""
    @Published var monthChanged: Bool = false
    @Published var year: String = ""
    @Published var yearChanged: Bool = false
    @Published var errorMsgExpDate: String = ""
    @Published var expDateIsBlank: Bool = false
}

class CvcData: ObservableObject {
    @Published var cvc: String = ""
    @Published var cvcChanged: Bool = false
    @Published var errorMsgCvc: String = ""
    @Published var cvcIsBlank: Bool = false
}


struct ContentView: View {
    @StateObject var nameData = inputNameData()
    @StateObject var cardNumData = cardNumberData()
    @StateObject var expirationData = expDateData()
    @StateObject var cvcData = CvcData()
    
    @State private var everythingOk: Bool = false
    
    let decimalCharacters = CharacterSet.decimalDigits
    
    var body: some View {
        VStack {
            CardsMainView(expirationData: expirationData, nameData: nameData, cardNumData: cardNumData, cvcData: cvcData)
            Spacer()
            if (everythingOk) {
                SuccessPage(everythingOk: $everythingOk, expirationData: expirationData, nameData: nameData, cardNumData: cardNumData, cvcData: cvcData)
            } else {
                VStack {
                    NameInput(data: nameData)
                    CardNumberInput(data: cardNumData)
                    HStack {
                        ExpDateInput(data: expirationData)
                        CvcInput(data: cvcData)
                    }
                    Button(action: {
                        checkFormFields()
                    }) {
                        Text("Confirm")
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
            }
            Spacer(minLength: 90)
        }
    }
    
    func formIsOk () -> Bool {
        if(!nameData.nameHasNumber && !cardNumData.cardNumberHasText && !expirationData.expDateIsBlank && !cvcData.cvcIsBlank) {
            return true
        } else {
            return false
        }
    }
    
    func checkFormFields () -> Void {
        if(expirationData.month == "" || expirationData.year == "") {
            expirationData.errorMsgExpDate = "Can´t be blank"
            expirationData.expDateIsBlank = true
        } else if(expirationData.month.count < 2 || expirationData.year.count < 2) {
            expirationData.errorMsgExpDate = "Please enter 2 digits"
            expirationData.expDateIsBlank = true
        } else {
            expirationData.errorMsgExpDate = ""
            expirationData.expDateIsBlank = false
        }
        

        if(cvcData.cvc == "") {
            cvcData.errorMsgCvc = "Can´t be blank"
            cvcData.cvcIsBlank = true
        } else if(cvcData.cvc.count < 3) {
            cvcData.errorMsgCvc = "Please enter 3 digits"
            cvcData.cvcIsBlank = true
        } else {
            cvcData.errorMsgCvc = ""
            cvcData.cvcIsBlank = false
        }
        
        if(nameData.name == "") {
            nameData.errorMsgName = "Can´t be blank"
            nameData.nameHasNumber = true
        } else {
            nameData.errorMsgName = ""
            nameData.nameHasNumber = false
        }
        
        if(cardNumData.card_number == "") {
            cardNumData.errorMsgCardNumber = "Can´t be blank"
            cardNumData.cardNumberHasText = true
        } else if (cardNumData.card_number.count < 16) {
            cardNumData.cardNumberHasText = true
            cardNumData.errorMsgCardNumber = "Please enter up to 16 digits"
        } else {
            cardNumData.cardNumberHasText = false
            cardNumData.errorMsgCardNumber = ""
        }
        
        if(formIsOk()) {
            everythingOk = true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



