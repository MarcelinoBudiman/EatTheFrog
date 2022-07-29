//
//  TaskCardView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 20/07/22.
//

import SwiftUI

struct TaskCardView: View {
    
    @EnvironmentObject var viewModel: EatTheFrogViewModel
    
    var body: some View {
        
        Text("Dont forget to catch your frog today!")
            .foregroundColor(.green)
            .fontWeight(.heavy)
            .font(.system(size: 21))
        
        if(viewModel.todayGoal.isEmpty){
            Text("Empty Data")
        } else {
            
            VStack(alignment: .leading){
                
                Text(viewModel.todayGoal[0].goalName!)
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .padding(.bottom, 5)
                    .padding(.trailing, 60)
                    .foregroundColor(Color.init(hex: "#646262"))
                
                Text(viewModel.todayGoal[0].goalDetails!)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .padding(.bottom, 15)
                    .foregroundColor(Color.init(hex: "#646262"))
                
                VStack {
                    HStack(alignment: .center){
                        
                        Image(systemName: "calendar")
                        Text(viewModel.todayGoal[0].goalDeadline!, style: .date)
                            .fontWeight(.bold).font(.system(size: 14))
                            .foregroundColor(.black)
                    }.padding(.trailing, 145)

                    HStack{
                        
                        Button{
                            viewModel.todayGoal[0].goalIsDone.toggle()
                            viewModel.save()
                        }label: {
                            Text("Flee")
                                .foregroundColor(.white)
                                .padding()
                        }.frame(width: 132, height: 42)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(hex: "#D67676")))
                        
                        Button{
                            viewModel.todayGoal[0].goalStatus.toggle()
                            viewModel.todayGoal[0].goalIsDone.toggle()
                            viewModel.save()
                        }label: {
                            Text("Catch")
                                .foregroundColor(.white)
                                .padding()
                        }.frame(width: 132, height: 42)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.init(hex: "#0A6CD7")))
                        
                    }
                }
            }
            .frame(width: 324, height: 178)
            .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.init(hex: "#BEECBE")))
            
        }
        
        
    }
}

struct TaskCardView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCardView()
    }
}

