//
//  FeedUploadModel.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/05/11.
//

struct FeeduploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
