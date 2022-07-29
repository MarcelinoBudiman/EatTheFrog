//
//  EatTheFrogViewModel.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 24/07/22.
//

import Foundation
import CoreData
import QuoteKit
import SwiftUI

class EatTheFrogViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var goals: [Goal] = []
    @Published var sortedGoals: [Goal] = []
    @Published var todayGoal: [Goal] = []
    
    
    init() {
        container = NSPersistentContainer(name: "Mapping")
        container.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        fetchGoals()
        fetchSortedGoals()
    }
    
    func fetchGoals(){
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        
        do{
            goals = try container.viewContext.fetch(request)
        } catch let error{
            fatalError("Error: \(error.localizedDescription)")
        }
        
    }
    
    func fetchSortedGoals(){
        let request = NSFetchRequest<Goal>(entityName: "Goal")
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(Goal.goalDeadline), ascending: true)]
      
        do{
            sortedGoals = try container.viewContext.fetch(request)
        } catch let error{
            fatalError("Error: \(error.localizedDescription)")
        }
        
        for goal in sortedGoals{
            if(Calendar.current.isDateInToday(goal.goalDeadline!)){
                todayGoal.append(goal)
            }
            
        }
        
    }
    
    func addGoals(name: String, detail: String, deadline: Date, reminder: Date, status: Bool, isDone: Bool){
        let goal = Goal(context: container.viewContext)
        
        if(Calendar.current.isDateInToday(deadline)){
            let newDeadline = deadline.dayAfter
            goal.goalDeadline = newDeadline
        } else {
            goal.goalDeadline = deadline
        }
        
        goal.goalName = name
        goal.goalDetails = detail
        goal.goalReminder = reminder
        goal.goalStatus = status
        goal.goalIsDone = isDone
    
        save()
    }
    
    func updateGoals(name: String, detail: String, deadline: Date, reminder: Date, status: Bool, isDone: Bool, goal: Goal){
        
        goal.goalName = name
        goal.goalDetails = detail
        goal.goalDeadline = deadline
        goal.goalReminder = reminder
        goal.goalStatus = status
        goal.goalIsDone = isDone
    
        save()
    }
    
    func deleteGoals(at offsets: IndexSet){
        for index in offsets{
            let deleteGoal = goals[index]
            delete(deleteGoal)
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}){
        let context = container.viewContext
        if context.hasChanges {
            // setiap ada changes maka mau save
            do {
                try context.save()
                fetchGoals() // supaya tiap dia save reload entity nya lagi
                fetchSortedGoals()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}){
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
    
}
