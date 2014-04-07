//
//  NLBDefaultURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBDefaultURLAction.h"

@implementation NLBDefaultURLAction

- (NSString *)name {
    return @"Unknown";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    return nil;
}

- (BOOL)canDoActionURL:(NSURL *)url {
    NSURL *customSchemeURL = [self customSchemeURLWithURL:url];
    return customSchemeURL != nil && [self canOpenURL:customSchemeURL];
}

- (BOOL)doActionURL:(NSURL *)url {
    NSURL *customSchemeURL = [self customSchemeURLWithURL:url];
    if (customSchemeURL != nil && [self canOpenURL:customSchemeURL]) {
        return [[UIApplication sharedApplication] openURL:customSchemeURL];
    }
    return false;
}

- (BOOL)canOpenURL:(NSURL *)customSchemeURL {
    return [[UIApplication sharedApplication] canOpenURL:customSchemeURL];
}

+ (NSString*) urlEncode:(NSString *)url {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
        kCFAllocatorDefault,
        (__bridge CFStringRef)url,
        NULL,
        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
        kCFStringEncodingUTF8));
}
@end
