//
//  Untitled.swift
//  bewavoca-iOS
//
//  Created by Muchan Kim on 12/19/24.
//

enum CharacterType: CaseIterable {
    case harbang
    case dongbaek
    case rabong
    case halla
    case jamneow
    case jejuma
    
    var image: String {
        switch self {
        case .harbang: return "harbang_image"
        case .dongbaek: return "dongbaek_image"
        case .rabong: return "rabong_image"
        case .halla: return "halla_image"
        case .jamneow: return "jamneow_image"
        case .jejuma: return "jejuma_image"
        }
    }
    
    var isLocked: Bool {
        switch self {
        case .tulip, .cat: return false
        default: return true  // 나머지는 잠긴 상태
        }
    }
}

