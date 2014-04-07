//
//  NLBURLAction.h
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NLBURLActionProtocol;

@interface NLBURLAction : NSObject
- (instancetype)initWithActionClasses:(NSArray *)actionClasses;
- (instancetype)initWithActionClasses:(NSArray *)actionClasses callbackURL:(NSURL *)callbackURL;
- (void)registerActionClass:(Class) actionClass;
- (NSArray *)arrayURLActionsWithURL:(NSURL *)url;
@property(readwrite) NSURL *callbackURL;
@end

@protocol NLBURLActionProtocol <NSObject>
@property(readonly) NSString *name;
- (BOOL)canDoActionURL:(NSURL *)url;
- (NSURL *)customSchemeURLWithURL:(NSURL *)url;
- (BOOL)doActionURL:(NSURL *)url;
@end
