//
//  HtmlDslTests.swift
//  HtmlDslTests
//
//  Created by Anton Efimenko on 06.12.2019.
//  Copyright © 2019 Anton Efimenko. All rights reserved.
//

import XCTest
@testable import HtmlDsl

class HtmlDslTests: XCTestCase {
    func testExample() {
        let doc = html {
            header {
                h1 {
                    text("Header")
                }
            }
            body {
                h1 {
                    text("Body text")
                }
            }
        }
        
        let expected =
        """
        <html>
            <header>
                <h1>
                    Header
                </h1>
            </header>
            <body>
                <h1>
                    Body text
                </h1>
            </body>
        </html>
        """
        
        XCTAssertEqual(expected, prettyRender(doc))
    }
}
