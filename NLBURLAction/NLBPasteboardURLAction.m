//
//  NLBSafariURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBPasteboardURLAction.h"

@implementation NLBPasteboardURLAction

- (NSString *)name {
    return @"Clipboard";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    return url;
}

- (BOOL)doActionURL:(NSURL *)url {
    [[UIPasteboard generalPasteboard] setValue:url forPasteboardType:@"public.url"];
    return true;
}
@end
