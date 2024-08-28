/*
 HistoryViewModel.swift
 
 This ViewModel manages the state and logic for the history feature.
 
 Tasks:
 - Handle loading, saving, and managing history items
 - Implement search and filter functionality
 - Coordinate with DatabaseService for persistence
 
 Uses code from:
 - HistoryItem.swift
 - DatabaseService.swift
 
 Used by:
 - HistoryView.swift
 
 Refer to ProjectSpecs.md for history tracking and management requirements.
*/

import Foundation
import Combine

class HistoryViewModel: ObservableObject {
    @Published var historyItems: [HistoryItem] = []
    @Published var searchQuery: String = ""
    
    private var databaseService: DatabaseService
    private var cancellables: Set<AnyCancellable> = []
    
    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
        loadHistory()
        setupBindings()
    }
    
    func loadHistory() {
        historyItems = databaseService.loadHistoryItems()
    }
    
    func addHistoryItem(_ item: HistoryItem) {
        databaseService.saveHistoryItem(item)
        historyItems.append(item)
    }
    
    func deleteHistoryItem(_ item: HistoryItem) {
        databaseService.deleteHistoryItem(item)
        historyItems.removeAll { $0.id == item.id }
    }
    
    private func setupBindings() {
        // Set up bindings for search and filter functionality
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .assign(to: &cancellables)
            .store(in: &cancellables)
    }
}