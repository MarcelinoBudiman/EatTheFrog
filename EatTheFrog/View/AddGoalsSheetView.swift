//
//  AddGoalsSheetView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 24/07/22.
//

import SwiftUI

struct AddGoalsSheetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: EatTheFrogViewModel
    @State var name: String
    @State var description: String
    @State var deadline: Date
    @State var reminder: Date
    @State var reminderOn: Bool = false
    var checkForm: Bool {
        name.count < 5 || description.isEmpty
    }
    
    var body: some View {
        
        NavigationView{
            
            Form{
                Section {
                    TextField("Frog Name", text: $name)
                    TextField("Frog Description", text: $description)
                }
                
                Section {
                    let tomorrow = Date().dayAfter
                    DatePicker("Frog Deadline",
                               selection: $deadline,
                               in: tomorrow...,
                               displayedComponents: .date)
                    .tint(Color.init(hex: "#1B9A20"))
                    
                 
                    Toggle("Reminder" ,isOn: $reminderOn)
                    
                    if(reminderOn){
                        DatePicker("Frog Reminder",
                                   selection: $reminder,
                                   in: Date().dayAfter...,
                                   displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                }
            }
            
            .navigationTitle("Add Your Frog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        
                        viewModel.addGoals(name: name, detail: description, deadline: deadline, reminder: reminder, status: false, isDone: false)
                        
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

struct AddGoalsSheetView_Previews: PreviewProvider {
    static var previews: some View {

        AddGoalsSheetView(name: "", description: "", deadline: Date.now, reminder: Date.now)
    }
}
