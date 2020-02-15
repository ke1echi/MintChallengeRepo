//
//  WebService.swift
//  iOSMintTest
//
//  Created by UNION on 15/02/2020.
//  Copyright © 2020 UNION. All rights reserved.
//

import Foundation


class WebService {
    func getCommits(completion: @escaping ([Commit]?) -> ()) {
        
        guard let url = URL(string: "https://api.github.com/repos/rails/rails/commits") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let commits = try? JSONDecoder().decode([Commit].self, from: data)
            
            DispatchQueue.main.async {
                completion(commits)
            }
        }.resume()
    }
}
