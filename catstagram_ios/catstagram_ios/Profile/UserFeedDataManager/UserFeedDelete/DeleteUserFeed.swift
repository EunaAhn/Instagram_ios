//
//  DeleteUserFeed.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/05/11.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
