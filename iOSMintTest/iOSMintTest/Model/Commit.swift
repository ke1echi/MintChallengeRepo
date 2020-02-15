//
//  Commit.swift
//  iOSMintTest
//
//  Created by UNION on 15/02/2020.
//  Copyright © 2020 UNION. All rights reserved.
//

import Foundation

struct Commit: Codable {
    let sha: String
    let commit: AuthorCommit
}

struct AuthorCommit: Codable {
    let message: String
    let author: Author
}

struct Author: Codable {
    let name: String
}
