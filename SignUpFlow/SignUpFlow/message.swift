//
//  message.swift
//  SignUpFlow
//
//  Created by sole on 2020/12/03.
//

import Foundation

enum Message: String {
    case existedID = "이미 존재하는 아이디입니다"
    case enterID = "아이디를 입력해주세요"
    case enterPassword = "패스워드를 입력해주세요"
    case disableSignIn = "지금은 로그인할 수 없습니다"
    case empty = ""
}
