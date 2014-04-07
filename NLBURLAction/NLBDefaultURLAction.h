//
//  NLBDefaultURLAction.h
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NLBURLAction.h"

@interface NLBDefaultURLAction : NSObject <NLBURLActionProtocol>
- (NSURL *)customSchemeURLWithURL:(NSURL *)url;
+ (NSString*) urlEncode:(NSString *)url;
@property (readwrite) NSURL *callbackURL;
@end
