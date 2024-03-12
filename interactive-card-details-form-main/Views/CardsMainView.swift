//
//  CardsMainView.swift
//  interactive-card-details-form-main
//
//  Created by Marcos Fabian Chong Megchun on 11/03/24.
//

import SwiftUI

struct CardsMainView: View {
    
    @ObservedObject var expirationData: expDateData
    @ObservedObject var nameData: inputNameData
    @ObservedObject var cardNumData: cardNumberData
    @ObservedObject var cvcData: CvcData
    
    var body: some View {
        ZStack {
            Image("bg-card-back")
                .resizable()
                .frame(maxWidth: 300, maxHeight: 190)
                .overlay(content: {
                    Text(cvcData.cvcChanged ? cvcData.cvc : "000")
                        .offset(x: 100)
                        .foregroundColor(Color("White"))
                        .font(.custom("SpaceGrotesk-Medium", size: 12))
                })
                .position(x: 220, y: 117)
            ZStack {
                Image("bg-card-front")
                    .resizable()
                    .frame(maxWidth: 300, maxHeight: 190)
                    .overlay(content: {
                        VStack (alignment: .leading) {
                            HStack (alignment: .center) {
                                Circle()
                                    .size(width: 40, height: 40)
                                    .fill(Color.white)
                                    .frame(width: 40, height: 40)
                                Circle()
                                    .size(width: 20, height: 20)
                                    .stroke(Color.white)
                                    .frame(width: 20, height: 20)
                            }
                            Spacer()
                                .frame(height: 50)
                            VStack {
                                Text(cardNumData.cardNumberChanged ? cardNumData.firstSubstring + " " : "0000 ")
                                    .font(.custom("SpaceGrotesk-Medium", size: 21))
                                    
                                + Text(cardNumData.cardNumberChanged ? cardNumData.secondSubstring + " " : "0000 ")
                                    .font(.custom("SpaceGrotesk-Medium", size: 21))
                                
                                + Text(cardNumData.cardNumberChanged ? cardNumData.thirdSubstring + " " : "0000 ")
                                    .font(.custom("SpaceGrotesk-Medium", size: 21))
                                
                                + Text(cardNumData.cardNumberChanged ? cardNumData.fourthSubstring + " " : "0000 ")
                                    .font(.custom("SpaceGrotesk-Medium", size: 21))
                            }
                            .padding(.bottom, 10)
                            HStack {
                                Text(nameData.nameChanged ? nameData.name : "JANE APPLESEED")
                                    .textCase(.uppercase)
                                Spacer()
                                Text(expirationData.monthChanged ? expirationData.month : "00")
                                + Text("/")
                                + Text(expirationData.yearChanged ? expirationData.year : "00")
                            }
                            .font(.custom("SpaceGrotesk-Medium", size: 12))
                            .fontWeight(.bold)
                        }
                        .foregroundColor(Color("White"))
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                    })
                    .position(x: 160, y: 220)
            }
            .position(x: 200, y: 105)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .padding(.top, 40)
        .padding(.bottom, 70)
        .background(
            Image("bg-main-mobile")
                .resizable()
                .frame(maxWidth: .infinity)
        )
        .ignoresSafeArea()
    }
}

//struct CardsMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardsMainView()
//    }
//}
