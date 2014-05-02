//
//  NLBGoogleDocsURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBGoogleDocsURLAction.h"

@interface NLBGoogleDocsURLActionTest : XCTestCase

@end

@implementation NLBGoogleDocsURLActionTest

- (void)testCustomSchemeURLWithURLSuccess {
    NLBGoogleDocsURLAction *action = [[NLBGoogleDocsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://docs.google.com/a/nulab.co.jp/document/ccc?key=exampleKey&usp=drive_web#gid=135"]];
    XCTAssertEqualObjects(@"googledocs://docs.google.com/a/nulab.co.jp/document/ccc?key=exampleKey&usp=drive_web#gid=135", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBGoogleDocsURLAction *action = [[NLBGoogleDocsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://hoge.google.com/a/nulab.co.jp/document/ccc?key=exampleKey&usp=drive_web#gid=135"]];
    XCTAssertNil(url.absoluteString);
}

@end
