//
//  ContentView.swift
//  EatTheFrog
//
//  Created by Marcelino Budiman on 20/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    
//    @FetchRequest(entity: Goal.entity(),
//                  sortDescriptors: [NSSortDescriptor(key: "goalName", ascending: true)])
//    var items: FetchedResults<Goal>
    
    @StateObject var viewModel = EatTheFrogViewModel()
    
    
    var body: some View {
        
        TabView{
            
            HomeView()
                .tabItem{
                Image(systemName: "house")
                Text("Home")
                }.environmentObject(viewModel)
            
            GoalsView()
                .tabItem{
                Image(systemName: "rosette")
                Text("Goals")
                }.environmentObject(viewModel)
            
        }
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
