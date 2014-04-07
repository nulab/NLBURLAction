//
//  NLBGoogleDriveURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBGoogleDriveURLAction.h"

@implementation NLBGoogleDriveURLAction


- (NSString *)name {
    return @"Google Drive";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https[:]//docs[.]google[.]com/(.+)$"
                                                          options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 2) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"googledrive%@", [[url absoluteString] substringFromIndex:5]]];
    } else {
        return nil;
    }
}
@end
