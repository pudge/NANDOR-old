//
//  Control.h
//  NANDOR
//
//  Created by Chris Nandor on 2014.05.31.
//  Copyright (c) 2014 Pudge.Net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Control : NSObject

-(void)playTrack:(NSString *)name isQuiet:(BOOL)isQuiet;
-(void)playHorn:(BOOL)play withTeam:(NSString *)team isQuiet:(BOOL)isQuiet;
-(void)stop;

@end
