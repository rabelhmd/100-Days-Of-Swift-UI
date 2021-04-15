//
//  Home.swift
//  iExpense
//
//  Created by Rabel Ahmed on 15/04/2021.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(self.color(forAmount: item.amount)) // Challange 2
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                leading: EditButton(), // Challenge 1
                trailing: Button(action: {
                self.showingAddExpense.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    private func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    // Challange 2
    private func color(forAmount amount: Int) -> Color {
        switch amount {
        case Int.min..<10: return .green
        case 10..<100: return .orange
        default: return .red
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
