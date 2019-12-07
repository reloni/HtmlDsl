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

func header(@HtmlBuilder _ content: () -> [HtmlNode]) -> HtmlNode {
    .element("header", content())
}

func header(@HtmlBuilder _ content: () -> HtmlNode) -> HtmlNode {
    .element("header", [content()])
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

func render(_ node: HtmlNode) -> String {
    switch node {
    case let .element(tag, children):
        return "<\(tag)>\(children.map(render).joined())</\(tag)>"
    case let .text(text):
        return text
    }
}

func prettyRender(_ node: HtmlNode) -> String {
    return levelRender(node, 0)
}

private func levelRender(_ node: HtmlNode, _ level: Int) -> String {
    let indent = String(repeating: "    ", count: level)
    switch node {
    case let .element(tag, children):
        let child = children.map { levelRender($0, level + 1) }.joined()
        let ending = level == 0 ? "" : "\n"
        return "\(indent)<\(tag)>\n\(child)\(indent)</\(tag)>\(ending)"
    case let .text(text):
        return "\(indent)\(text)\n"
    }
}
