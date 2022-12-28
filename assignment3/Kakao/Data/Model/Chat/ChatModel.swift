//
//  Chat.swift
//  Kakao
//
//  Created by 이승헌 on 2022/11/04.
//

import Foundation

struct ChatModel {
    let profileImage: String
    let title: String
    let message: String
    let time: String
}

let chatDummyData: [ChatModel] = [
    ChatModel(profileImage: "profileImage1", title: "안솝트", message: "iOS개발을 깨우쳤다", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage2", title: "최솝트", message: "iOS... 시시해져버렸다", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage3", title: "정솝트", message: "내가 iOS를 할 수 있을까", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage4", title: "강솝트", message: "테이블 뷰가 뭐에요?", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage5", title: "오솝트", message: "안선생님 개발이 하고 싶어요", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage6", title: "황솝트", message: "행복하자...", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage7", title: "이솝트", message: "솝트 아요미들이 최고야!!", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage8", title: "강솝트", message: "iOS에 대해 모르는게 없다", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage9", title: "하솝트", message: "하남자특 iOS개발 못함 ㅋㅋ", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage1", title: "안솝트", message: "iOS개발을 깨우쳤다", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage2", title: "최솝트", message: "iOS... 시시해져버렸다", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage3", title: "정솝트", message: "내가 iOS를 할 수 있을까", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage4", title: "강솝트", message: "테이블 뷰가 뭐에요?", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage5", title: "오솝트", message: "안선생님 개발이 하고 싶어요", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage6", title: "황솝트", message: "행복하자...", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage7", title: "이솝트", message: "솝트 아요미들이 최고야!!", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage8", title: "강솝트", message: "iOS에 대해 모르는게 없다", time: "오후 9:41"),
    ChatModel(profileImage: "profileImage9", title: "하솝트", message: "하남자특 iOS개발 못함 ㅋㅋ", time: "오후 9:41")
]
