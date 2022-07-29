//
//  HomeView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 21/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewModel: EatTheFrogViewModel
    
    var body: some View {
        
        VStack() {
            
            if(viewModel.todayGoal.isEmpty){
                Spacer()
                
                Image("frog_sleeping")
                    .resizable(capInsets: EdgeInsets())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 323.71, height: 332)
                
                Spacer()
                
                DoneCardView()
            } else {
                switch(viewModel.todayGoal[0].goalIsDone){
                    
                case true:
                    if(viewModel.todayGoal[0].goalStatus == true){
                        
                        Spacer()
                        
                        Image("frog_sleeping")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 323.71, height: 332)
                        
                        Spacer()
                        
                        DoneCardView()
                    } else if (viewModel.todayGoal[0].goalStatus == false){
                        
                        Spacer()
                        
                        
                        Image("leaf")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 323.71, height: 332)
                        
                        Spacer()
                        
                        FalseCardView()
                    }
                    
                case false:
                    
                    Spacer()
                    
                    Image("frog")
                        .resizable(capInsets: EdgeInsets())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 323.71, height: 332)
                    
                    Spacer()
                    
                    TaskCardView().environmentObject(self.viewModel)
                
                    
                }
            }
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
