//
//  UserModel.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/01.
//

import Foundation

struct UserModel {
    let profileImage: String
    let name: String
    let statusMessage: String
}

var userDummyData: [UserModel] = [
    UserModel(profileImage: "profileImage1", name: "안솝트", statusMessage: "iOS개발을 깨우쳤다"),
    UserModel(profileImage: "profileImage2", name: "최솝트", statusMessage: "iOS... 시시해져버렸다"),
    UserModel(profileImage: "profileImage3", name: "정솝트", statusMessage: "내가 iOS를 할 수 있을까"),
    UserModel(profileImage: "profileImage4", name: "강솝트", statusMessage: "테이블 뷰가 뭐에요?"),
    UserModel(profileImage: "profileImage5", name: "오솝트", statusMessage: "안선생님 개발이 하고 싶어요"),
    UserModel(profileImage: "profileImage6", name: "황솝트", statusMessage: "행복하자..."),
    UserModel(profileImage: "profileImage7", name: "이솝트", statusMessage: "솝트 아요미들이 최고야!!"),
    UserModel(profileImage: "profileImage8", name: "강솝트", statusMessage: "iOS에 대해 모르는게 없다"),
    UserModel(profileImage: "profileImage9", name: "하솝트", statusMessage: "하남자특 iOS개발 못함 ㅋㅋ")
]

var multiProfile: [UserModel] = [
    UserModel(profileImage: "profileImage1", name: "친구별로 다른 프로필을 설정해보세요!", statusMessage: "")
]

var birthDay: [UserModel] = [
    UserModel(profileImage: "profileImage2", name: "친구의 생일을 확인해 보세요!", statusMessage: "")
]

var bookMark: [UserModel] = [
    UserModel(profileImage: "profileImage3", name: "엄마", statusMessage: "안녕하세요"),
    UserModel(profileImage: "profileImage4", name: "아빠", statusMessage: "반갑습니다"),
    UserModel(profileImage: "profileImage5", name: "형", statusMessage: "잘부탁드려요")
]

var recommendedFriend: [UserModel] = [
    UserModel(profileImage: "profileImage7", name: "새로운 친구를 만나보세요", statusMessage: "")
]

var channel: [UserModel] = [
    UserModel(profileImage: "profileImage8", name: "채널", statusMessage: "")
]
