//
//  GoalDetailSheet.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 25/07/22.
//

import SwiftUI



struct GoalDetailSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: EatTheFrogViewModel
    @State var reminderOn: Bool = false
    @State var goal: Goal
    @State var name: String = ""
    @State var description: String = ""
    @State var deadline: Date
    @State var reminder: Date
    @State var status: Bool
    @State var isDone: Bool
    
    var checkForm: Bool {
        name.count < 5 || description.isEmpty
    }
    
    
    var body: some View {
      
            NavigationView{
                
                Form{
                    Section {
                        TextField(goal.goalName!, text: $name)
                            .onAppear{
                                name = goal.goalName!
                                deadline = goal.goalDeadline!
                                isDone = goal.goalIsDone
                            }

                        TextField(goal.goalDetails!, text: $description)
                            .onAppear {
                                description = goal.goalDetails!
                                reminder = goal.goalReminder!
                                status = goal.goalStatus
                        }
                    }
                    
                    Section {
            
                        DatePicker("Frog Deadline",
                                   selection: $deadline,
                                   in: goal.goalDeadline!...,
                                   displayedComponents: .date)
                        .tint(Color.init(hex: "#1B9A20"))
                        
                     
                        Toggle("Reminder" ,isOn: $reminderOn)
                        
                        if(reminderOn){
                            DatePicker("Frog Reminder",
                                       selection: $reminder,
                                       in: goal.goalReminder!.dayAfter...,
                                       displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                        }
                        
                    }
                    
                    Section {
                        Button(action: {
                            
                            // INI GIMANA SUPAYA BISA ADD NEW ROW
                            
                        }, label: {
                            Text("Add new subtasks")
                                .tint(Color.init(hex: "#1B9A20"))
                        })
                    }
                    
                }
                
                .navigationTitle("Frog Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Button(action: {
                            
                            viewModel.updateGoals(name: name, detail: description, deadline: deadline, reminder: reminder,  status: status, isDone: isDone, goal: goal)
                            
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Done")
                                .tint(Color.init(hex: "#1B9A20"))
                        }).disabled(checkForm)
                    }
                }
                
            }
            
        }
        
}

struct GoalDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetailSheet(goal: Goal(), deadline: Date.now, reminder: Date.now, status: false, isDone: false)
    }
}
