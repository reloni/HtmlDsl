//
//  Html.swift
//  HtmlDsl
//
//  Created by Anton Efimenko on 06.12.2019.
//  Copyright © 2019 Anton Efimenko. All rights reserved.
//

import Foundation

enum HtmlNode {
    case text(String)
    indirect case element(String, [HtmlNode])
}

extension HtmlNode {
    
}

func h1(@HtmlBuilder _ content: () -> [HtmlNode]) -> HtmlNode {
    .element("h1", content())
}

func h1(@HtmlBuilder _ content: () -> HtmlNode) -> HtmlNode {
    .element("h1", [content()])
}

func title(@HtmlBuilder _ content: () -> HtmlNode) -> HtmlNode {
    .element("title", [content()])
}

func p(@HtmlBuilder _ content: () -> [HtmlNode]) -> HtmlNode {
    .element("p", content())
}

func p(@HtmlBuilder _ content: () -> HtmlNode) -> HtmlNode {
    .element("p", [content()])
}

func html(@HtmlBuilder _ content: () -> [HtmlNode]) -> HtmlNode {
    .element("html", content())
}

func head(@HtmlBuilder _ content: () -> [HtmlNode]) -> HtmlNode {
    .element("head", content())
}

func head(@HtmlBuilder _ content: () -> HtmlNode) -> HtmlNode {
    .element("head", [content()])
}

func body(@HtmlBuilder _ content: () -> [HtmlNode]) -> HtmlNode {
    .element("body", content())
}

func body(@HtmlBuilder _ content: () -> HtmlNode) -> HtmlNode {
    .element("body", [content()])
}

func text(_ value: String) -> HtmlNode {
    .text(value)
}

func html(@HtmlBuilder _ content: () -> HtmlNode) -> [HtmlNode] {
    [content()]
}

@_functionBuilder
struct HtmlBuilder {
    static func buildBlock(_ items: HtmlNode...) -> [HtmlNode] {
        items
    }
    
    static func buildBlock(_ item: HtmlNode) -> [HtmlNode] {
        [item]
    }
}
