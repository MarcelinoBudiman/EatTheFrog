//
//  GoalsView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 21/07/22.
//

import SwiftUI

struct GoalsView: View {
    
   // @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var viewModel: EatTheFrogViewModel
    @State private var showAddGoals = false
    @State private var showGoalDetails = false
    
    var body: some View {
        var index: Int = 0
        NavigationView {
            
            VStack{
                
                    if(viewModel.goals.isEmpty){
                        Text("Frog list is empty!!\nPlease insert a new frog to catch!!")
                            .foregroundColor(Color.init(hex: "#5A9126"))
                            .fontWeight(.heavy)
                            .font(.system(size: 21))
                            .padding(.trailing, 70)
                    } else {
                        List{
                            ForEach(0...(viewModel.goals.count-1), id:\.self){ index1 in
                                
                                // INI GIMANA SUPAYA BISA TAP LISTNYA BUKAN TEXTNYA
                                Text("\(viewModel.goals[index1].goalName ?? "Unknown")")
                                    .onTapGesture {
                                        showGoalDetails.toggle()
                                        index = index1
                                    }.sheet(isPresented: $showGoalDetails){
                                        GoalDetailSheet(goal: viewModel.goals[index], name: "", description: "", deadline: Date(), reminder: Date(), status: false, isDone: false).environmentObject(self.viewModel)
                                    }
                            }
                            .onDelete(perform: viewModel.deleteGoals)
                        }
                    }
                    
                
                
            }
            
            .navigationTitle("Goals")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    
                    Button(action: {
                        showAddGoals.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                    }).foregroundColor(Color.init(hex: "#1B9A20"))
                        .sheet(isPresented: $showAddGoals){
                            AddGoalsSheetView(name: "", description: "", deadline: Date.now, reminder: Date.now).environmentObject(self.viewModel)
                            
                        }
                    
                }
            
            }
            
        }
    }
       
    
}


struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView().environmentObject(EatTheFrogViewModel())
    }
}

