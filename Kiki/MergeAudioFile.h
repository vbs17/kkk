//
//  MergeAudioFile.h
//  Kiki
//
//  Created by kei ikeuchi on 2016/11/26.
//  Copyright © 2016年 mycompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MergeAudioFile : NSObject
- (void)merge:(NSURL *)inURL with:(NSURL *)appendURL;

@end
