//
//  NLBTweetbotURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBTweetbotURLAction.h"

@implementation NLBTweetbotURLAction
- (NSString *)name {
    return @"Tweetbot";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https?[:]//(mobile[.])?twitter[.]com/([a-zA-Z0-9_]+)(/status/([0-9]+))?[?]?"
                                 options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 5 && [match rangeAtIndex:3].length == 0) {
        NSString *user = [url.absoluteString substringWithRange:[match rangeAtIndex:2]];
        return [self appendCallbackURL:[NSURL URLWithString:[NSString stringWithFormat:@"tweetbot://%@/user_profile/%@", user, user]]];
    } else if (match.numberOfRanges == 5 && [match rangeAtIndex:3].length > 0) {
        NSString *user = [url.absoluteString substringWithRange:[match rangeAtIndex:2]];
        NSString *statusId = [url.absoluteString substringWithRange:[match rangeAtIndex:4]];
        return [self appendCallbackURL:[NSURL URLWithString:[NSString stringWithFormat:@"tweetbot://%@/status/%@", user, statusId]]];
    } else {
        return nil;
    }
}

- (NSURL *)appendCallbackURL:(NSURL *)url {
    if (self.callbackURL) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@?callback_url=%@", url.absoluteString, [NLBDefaultURLAction urlEncode:self.callbackURL.absoluteString]]];
    } else {
        return url;
    }
}

@end
