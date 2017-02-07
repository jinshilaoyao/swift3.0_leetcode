//: Playground - noun: a place where people can play

import Foundation

//使用常量
let key = "isUserLoggedIn"
UserDefaults.standard.set(true, forKey: key)
UserDefaults.standard.bool(forKey: key)


//分组常量

struct Constants1 {
    let isUserLoggedIn = "isUserLoggedIn"
}
UserDefaults.standard.set(true, forKey: Constants1().isUserLoggedIn)


//添加上下文

struct Constants2 {
    struct Account {
        let isUserLoggedIn = "isUserLoggedIn"
    }

}
UserDefaults.standard
        .set(true, forKey: Constants2.Account().isUserLoggedIn)
UserDefaults.standard
    .bool(forKey: Constants2.Account().isUserLoggedIn)




enum Constants {
    enum Account : String {
        case isUserLoggedIn
    }

}
    UserDefaults.standard
        .set(true, forKey: Constants.Account.isUserLoggedIn.rawValue)
UserDefaults.standard
    .bool(forKey: Constants.Account.isUserLoggedIn.rawValue)


//let format = DateFormatter()
//format.dateStyle = .medium
//format.timeStyle = .none
//
let date = Date(timeIntervalSinceReferenceDate: 118900)
//
//format.locale = Locale(identifier: "en_US")
//format.string(from: date)

let format = DateFormatter()

format.locale = Locale(identifier: "en_US_POSIX")
format.dateFormat = "yyyy-MM-dd 'T' HH:mm:ss ZZZZ"
format.timeZone = TimeZone(secondsFromGMT: 0)
print(format.string(from: date))

