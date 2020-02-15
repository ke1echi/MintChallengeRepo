//
//  CommitListViewModel.swift
//  iOSMintTest
//
//  Created by UNION on 15/02/2020.
//  Copyright © 2020 UNION. All rights reserved.
//

import Foundation


class CommitListViewModel: ObservableObject, Identifiable {
    @Published var commits = [CommitViewModel]()
    
    init() {
        
        WebService().getCommits { commits in
            
            if let commits = commits {
                self.commits = commits.map(CommitViewModel.init)
                
                print("The commits are --> \(commits)")
            }
            
        }
    }
}


struct CommitViewModel: Codable, Identifiable {
    var id = UUID()
    var commit: Commit
    
    init(commit: Commit) {
        self.commit = commit
    }
    
    var sha: String {
        return self.commit.sha
    }
    
    var message: String {
        return self.commit.commit.message
    }
    
    var name: String {
        return commit.commit.author.name
    }
}
