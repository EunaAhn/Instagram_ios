//
//  FeedUploadDataManager.swift
//  catstagram_ios
//
//  Created by Euna Ahn on 2022/05/11.
//

import Alamofire

class FeedUploadDataManager {
    func posts(_ viewController : HomeViewController, _ parameter: FeeduploadInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeeduploadModel.self){
            response in switch response.result{
            case .success(let result):
                if result.isSuccess {
                    print("성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
