//
//  NLBGoogleSheetsURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBGoogleSheetsURLAction.h"

@interface NLBGoogleSheetsURLActionTest : XCTestCase

@end

@implementation NLBGoogleSheetsURLActionTest

- (void)testCustomSchemeURLWithURLSuccess {
    NLBGoogleSheetsURLAction *action = [[NLBGoogleSheetsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://docs.google.com/a/nulab.co.jp/spreadsheet/ccc?key=exampleKey&usp=drive_web#gid=135"]];
    XCTAssertEqualObjects(@"googlesheets://docs.google.com/a/nulab.co.jp/spreadsheet/ccc?key=exampleKey&usp=drive_web#gid=135", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBGoogleSheetsURLAction *action = [[NLBGoogleSheetsURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://hoge.google.com/a/nulab.co.jp/spreadsheet/ccc?key=exampleKey&usp=drive_web#gid=135"]];
    XCTAssertNil(url.absoluteString);
}

@end
