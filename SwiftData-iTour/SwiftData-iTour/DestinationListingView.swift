//
//  DestinationListingView.swift
//  SwiftData-iTour
//
//  Created by Heecheon Park on 10/2/23.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    
    @Environment(\.modelContext) var modelContext
    // @Query is corresponded binding for @Model
    // @Query var destinations: [Destination]
    /// sort
    ///    @Query(sort: \Destination.name, order: .reverse) var destinations: [Destination]
    ///
    ///    @Query(sort: [
    ///        SortDescriptor(\Destination.name),
    ///        SortDescriptor(\Destination.priority, order: .reverse)
    ///    ]) var destinations: [Destination]
    ///
    @Query(sort: [
        SortDescriptor(\Destination.name),
        SortDescriptor(\Destination.priority, order: .reverse)
    ]) var destinations: [Destination]
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
        self._destinations = Query(filter: #Predicate {
            if searchString.isEmpty { return true }
            else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
