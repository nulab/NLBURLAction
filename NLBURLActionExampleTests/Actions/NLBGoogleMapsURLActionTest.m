//
//  NLBGoogleMapsURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBGoogleMapsURLAction.h"

@interface NLBGoogleMapsURLActionTest : XCTestCase

@end

@implementation NLBGoogleMapsURLActionTest

- (void)testCustomSchemeURLWithURLSuccess1 {
    NLBGoogleMapsURLAction *action = [[NLBGoogleMapsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://www.google.co.jp/maps/search/%E5%8D%9A%E5%A4%9A%E5%8C%BA%E6%9D%B1%E4%B8%AD%E6%B4%B2/@33.5949447,130.4063882,18z"]];
    XCTAssertEqualObjects(@"comgooglemaps://www.google.co.jp/maps/search/%E5%8D%9A%E5%A4%9A%E5%8C%BA%E6%9D%B1%E4%B8%AD%E6%B4%B2/@33.5949447,130.4063882,18z", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLSuccess2 {
    NLBGoogleMapsURLAction *action = [[NLBGoogleMapsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://www.google.com/maps/search/%E5%8D%9A%E5%A4%9A%E5%8C%BA%E6%9D%B1%E4%B8%AD%E6%B4%B2/@33.5949447,130.4063882,18z"]];
    XCTAssertEqualObjects(@"comgooglemaps://www.google.com/maps/search/%E5%8D%9A%E5%A4%9A%E5%8C%BA%E6%9D%B1%E4%B8%AD%E6%B4%B2/@33.5949447,130.4063882,18z", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLSuccess3 {
    NLBGoogleMapsURLAction *action = [[NLBGoogleMapsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://goo.gl/maps/abcde"]];
    XCTAssertEqualObjects(@"comgooglemaps://goo.gl/maps/abcde", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBGoogleMapsURLAction *action = [[NLBGoogleMapsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://www.google.co.jp/search/%E5%8D%9A%E5%A4%9A%E5%8C%BA%E6%9D%B1%E4%B8%AD%E6%B4%B2/@33.5949447,130.4063882,18z"]];
    XCTAssertNil(url.absoluteString);
}

@end
