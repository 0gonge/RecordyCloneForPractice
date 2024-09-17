//
//  PretendardFont.swift
//  RecordyClone
//
//  Created by 송여경 on 9/18/24.
//
import UIKit

enum PretendardFont {
  case headline(_ weight: UIFont.Weight)
  case title1(_ weight: UIFont.Weight)
  case title2(_ weight: UIFont.Weight)
  case title3(_ weight: UIFont.Weight)
  case subtitle(_ weight: UIFont.Weight)
  case body1(_ weight: UIFont.Weight)
  case body2(_ weight: UIFont.Weight, isLong: Bool = false)
  case caption1(_ weight: UIFont.Weight, isUnderline: Bool = false)
  case caption2(_ weight: UIFont.Weight)
  case button1(_ weight: UIFont.Weight)
  case button2(_ weight: UIFont.Weight, isBold: Bool = false)
  
  var fontWeight: UIFont.Weight {
    switch self {
    case
        .headline(let weight),
        .title1(let weight),
        .title2(let weight),
        .title3(let weight),
        .subtitle(let weight),
        .body1(let weight),
        .body2(let weight, _),
        .caption1(let weight, _),
        .caption2(let weight),
        .button1(let weight),
        .button2(let weight, _):
      return weight
    }
  }
  
  var fontName: String {
    switch self.fontWeight {
    case .bold:
      return "Pretendard-Bold"
    case .semibold:
      return "Pretendard-SemiBold"
    case .medium:
      return "Pretendard-Medium"
    case .regular:
      return "Pretendard-Regular"
    default:
      return "Pretendard-Regular"
    }
  }
  
  var fontSize: CGFloat {
    switch self {
    case .headline:
      return 26
    case .title1:
      return 22
    case .title2:
      return 20
    case .title3:
      return 18
    case .subtitle:
      return 16
    case .body1:
      return 16
    case .body2:
      return 14
    case .caption1:
      return 12
    case .caption2:
      return 10
    case .button1:
      return 16
    case .button2:
      return 14
    }
  }
  
  var lineHeight: CGFloat {
    switch self {
    case .headline:
      return 38
    case .title1:
      return 32
    case .title2:
      return 30
    case .title3:
      return 24
    case .subtitle:
      return 28
    case .body1:
      return 24
    case .body2(_, let isLong):
      return isLong ? 24 : 20
    case .caption1, .caption2:
      return 18
    case .button1:
      return 24
    case .button2(_, let isBold):
      return isBold ? 18 : 20
    }
  }
  
  var letterSpacing: CGFloat {
    switch self {
    case .headline, .title1:
      return -0.5
    case .body2(let weight, _):
      return weight == .bold ? -0.5 : 0
    default:
      return 0
    }
  }
  
  var underlineStyle: NSUnderlineStyle? {
    switch self {
    case .caption1(_, let isUnderline):
      return isUnderline ? .single : nil
    default:
      return nil
    }
  }
  
  var attributes: [NSAttributedString.Key: Any] {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = self.letterSpacing
    paragraphStyle.lineHeightMultiple = self.lineHeight / self.fontSize
    
    var attributes: [NSAttributedString.Key: Any] = [
      .paragraphStyle: paragraphStyle,
      .font: UIFont(name: self.fontName, size: self.fontSize) ??
        .systemFont(ofSize: self.fontSize, weight: self.fontWeight)
    ]
    
    if let underlineStyle = self.underlineStyle {
      attributes[.underlineStyle] = underlineStyle.rawValue
    }
    
    return attributes
  }
}
