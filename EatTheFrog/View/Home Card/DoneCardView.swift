//
//  DoneCardView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 26/07/22.
//

import SwiftUI

struct DoneCardView: View {
    var body: some View {
        Text("Congratulations,\nYou’ve caught your frog!!\nSee you tomorrow")
            .foregroundColor(Color.init(hex: "#5A9126"))
            .fontWeight(.heavy)
            .font(.system(size: 21))
            .padding(.trailing, 70)
    }
}

struct DoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        DoneCardView()
    }
}
