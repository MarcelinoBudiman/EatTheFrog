//
//  FalseCardView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 26/07/22.
//

import SwiftUI
import QuoteKit

struct FalseCardView: View {
    
 //  @StateObject var quotesVM: QuotesViewModel
    
    var body: some View {
        Text("FAILEEEDDDD")
            .foregroundColor(Color.init(hex: "#D67676"))
            .fontWeight(.heavy)
            .font(.system(size: 21))
            .padding(.trailing, 70)
       // Text(quotesVM.quote!.content) // API BUAT NARIK
    }
}

struct FalseCardView_Previews: PreviewProvider {
    static var previews: some View {
        FalseCardView()
    }
}
