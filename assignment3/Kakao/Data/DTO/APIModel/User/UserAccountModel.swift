//
//  UserSignupModel.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/17.
//

import Foundation

// Codable
/*
 자신을 변환하거나 외부표현(external representation)으로 변환할 수 있는 타입입니다.
 외부표현 ex) JSON같은거,,,
 
 codable은 Encodable과 Decodable을 포함하고 있습니다.
 Encodable
 자신을 외부표현에서 디코딩 할 수 있는 타입
 
 Decodable
 자신을 외부표현으로 인코딩 할 수 있는 타입
 */

struct UserLoginModel: Codable {
    let email: String?
    let contact: String?
    let password: String
}

struct UserSignupModel: Codable {
    let email: String?
    let contact: String?
    let password: String
    let passwordCheck: String
}
