//
//  MarkdownCode.swift
//  Pods
//
//  Created by Ivan Bruel on 18/07/16.
//
//

import Foundation

open class MarkdownCode: MarkdownCommonElement {

  fileprivate static let regex = "(\\`{1})(.+?)(\\`{1})"

  open var font: MarkdownFont?
  open var color: MarkdownColor?

  open var regex: String {
    return MarkdownCode.regex
  }

  public init(font: MarkdownFont? = nil, color: MarkdownColor? = nil) {
    self.font = font
    self.color = color
  }

  open func addAttributes(_ attributedString: NSMutableAttributedString, range: NSRange) {
    let matchString: String = attributedString.attributedSubstring(from: range).string
    guard let unescapedString = matchString.unescapeUTF16() else { return }
    attributedString.replaceCharacters(in: range, with: unescapedString)
    attributedString.addAttributes(attributes, range: NSRange(location: range.location, length: unescapedString.characters.count))
  }
}
