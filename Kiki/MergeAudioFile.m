//
//  MergeAudioFile.m
//  Kiki
//
//  Created by kei ikeuchi on 2016/11/26.
//  Copyright © 2016年 mycompany. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "MergeAudioFile.h"
@implementation MergeAudioFile
- (void)merge:(NSURL *)inURL with:(NSURL *)appendURL {
    
    NSError *error;
    
    //一度に変換するフレーム数
    UInt32 convertFrames = 1024;
    
    //変数の宣言
    OSStatus err = noErr;
    UInt32 size;
    ExtAudioFileRef inAudioFileRef = NULL;
    ExtAudioFileRef appendAudioFileRef = NULL;
    ExtAudioFileRef outAudioFileRef = NULL;
    AudioStreamBasicDescription inFileFormat, ioClientFormat;
    void *ioData = NULL;
    NSURL *outURL;
    do {
        err = ExtAudioFileOpenURL((__bridge CFURLRef _Nonnull)(inURL), &inAudioFileRef);
        if (err != noErr) {
            break;
        }
        
        //読み込み側のオーディオファイルからフォーマットを取得する
        size = sizeof(inFileFormat);
        err = ExtAudioFileGetProperty(
                                      inAudioFileRef, kExtAudioFileProperty_FileDataFormat,
                                      &size, &inFileFormat);
        if (err != noErr) {
            break;
        }
        
        // 追加用オーディオファイルオープン
        err = ExtAudioFileOpenURL((__bridge CFURLRef _Nonnull)(appendURL), &appendAudioFileRef);
        if (err != noErr) {
            break;
        }
        
        // 書き出し用ファイルオープン(入力ファイルのフォーマット(m4a)を使用)
        NSString *outPath = [[inURL.path stringByDeletingPathExtension] stringByAppendingString:@"outfile.m4a"];
        outURL = [NSURL fileURLWithPath:outPath];
        err = ExtAudioFileCreateWithURL((__bridge CFURLRef _Nonnull)(outURL), kAudioFileM4AType, &inFileFormat,
                                        NULL, kAudioFileFlags_EraseFile, &outAudioFileRef);
        if (err != noErr) {
            break;
        }
        
        //読み書き両方のクライアントフォーマットを設定する
        ioClientFormat.mSampleRate = inFileFormat.mSampleRate;
        ioClientFormat.mFormatID = kAudioFormatLinearPCM;
        ioClientFormat.mFormatFlags = kAudioFormatFlagsNativeFloatPacked;
        ioClientFormat.mBitsPerChannel = 32;
        ioClientFormat.mChannelsPerFrame = inFileFormat.mChannelsPerFrame;
        ioClientFormat.mFramesPerPacket = 1;
        ioClientFormat.mBytesPerFrame =
        ioClientFormat.mBitsPerChannel / 8 * ioClientFormat.mChannelsPerFrame;
        ioClientFormat.mBytesPerPacket =
        ioClientFormat.mBytesPerFrame * ioClientFormat.mFramesPerPacket;
        
        size = sizeof(ioClientFormat);
        err = ExtAudioFileSetProperty(
                                      outAudioFileRef, kExtAudioFileProperty_ClientDataFormat,
                                      size, &ioClientFormat);
        if (err != noErr) {
            break;
        }
        
        size = sizeof(ioClientFormat);
        err = ExtAudioFileSetProperty(
                                      appendAudioFileRef, kExtAudioFileProperty_ClientDataFormat,
                                      size, &ioClientFormat);
        if (err != noErr) {
            break;
        }
        
        size = sizeof(ioClientFormat);
        err = ExtAudioFileSetProperty(
                                      inAudioFileRef, kExtAudioFileProperty_ClientDataFormat,
                                      size, &ioClientFormat);
        if (err != noErr) {
            break;
        }
        
        //オーディオデータの読み書きに使用するメモリ領域を確保する
        UInt32 allocByteSize = convertFrames * ioClientFormat.mBytesPerFrame;
        //オーディオデータの読み書きに使用するAudioBufferListを作成する
        AudioBufferList baseBufferList;
        baseBufferList.mNumberBuffers = 1;
        baseBufferList.mBuffers[0].mNumberChannels = ioClientFormat.mChannelsPerFrame;
        baseBufferList.mBuffers[0].mDataByteSize = allocByteSize;
        ioData = malloc(allocByteSize);
        if (!ioData) {
            err = 1002;
            break;
        }
        baseBufferList.mBuffers[0].mData = ioData;
        
        AudioBufferList appendBufferList;
        appendBufferList.mNumberBuffers = 1;
        appendBufferList.mBuffers[0].mNumberChannels = ioClientFormat.mChannelsPerFrame;
        appendBufferList.mBuffers[0].mDataByteSize = allocByteSize;
        ioData = malloc(allocByteSize);
        if (!ioData) {
            err = 1003;
            break;
        }
        appendBufferList.mBuffers[0].mData = ioData;
        
        BOOL baseFileEnd = NO;
        BOOL appendFileEnd = NO;
        
        //オーディオデータをコピーする
        while (1) {
            //フレーム数とデータサイズを設定する
            UInt32 baseFrames = convertFrames;
            UInt32 appendFrames = convertFrames;
            
            baseBufferList.mBuffers[0].mDataByteSize = allocByteSize;
            appendBufferList.mBuffers[0].mDataByteSize = allocByteSize;
            
            if (!baseFileEnd) {
                // ベースのオーディオデータを読み込む
                err = ExtAudioFileRead(inAudioFileRef, &baseFrames, &baseBufferList);
                if (err != noErr) {
                    NSLog(@"ExtAudioFileRead(base) err = %ld", (long)err);
                    break;
                }
                if (baseFrames == 0) {
                    baseFileEnd = YES;
                }
            }
            if (!appendFileEnd) {
                // 追加のオーディオデータを読み込む
                err = ExtAudioFileRead(appendAudioFileRef, &appendFrames, &appendBufferList);
                if (err != noErr) {
                    NSLog(@"ExtAudioFileRead(append) err = %ld", (long)err);
                    break;
                }
                if (appendFrames == 0) {
                    appendFileEnd = YES;
                }
            }
            
            AudioBufferList outBufferList;
            UInt32 outFrames;
            if (baseFileEnd) {
                // ベースファイル終了
                if (appendFileEnd) {
                    // 終了
                    break;
                } else {
                    // appendファイルを書き込む
                    outFrames = appendFrames;
                    outBufferList = appendBufferList;
                }
            } else {
                // ベースファイルあり
                if (appendFileEnd) {
                    // baseファイルを書き込む
                    outFrames = baseFrames;
                    outBufferList = baseBufferList;
                } else {
                    if (baseFrames < appendFrames) {
                        // 先にベースファイルを書き込む
                        err = ExtAudioFileWrite(outAudioFileRef, baseFrames, &baseBufferList);
                        if (err != noErr) {
                            NSLog(@"ExtAudioFileWrite (base) err = %ld", (long)err);
                            break;
                        }
                        // 残りのappendデータを書き込む
                        UInt32 remainFrames = appendFrames - baseFrames;
                        size_t remainBytes = remainFrames*ioClientFormat.mBytesPerFrame;
                        int startBytes = baseFrames*ioClientFormat.mBytesPerFrame;
                        memmove(&appendBufferList.mBuffers[0].mData[0],
                                &appendBufferList.mBuffers[0].mData[startBytes],
                                remainBytes);
                        outFrames = remainFrames;
                        outBufferList = appendBufferList;
                        
                    } else {
                        // baseファイルを書き込む
                        outFrames = baseFrames;
                        outBufferList = baseBufferList;
                    }
                }
            }
            
            //書き込み側のオーディオファイルへ書き込む
            err = ExtAudioFileWrite(outAudioFileRef, outFrames, &outBufferList);
            if (err != noErr) {
                NSLog(@"ExtAudioFileWrite(out) err = %ld", (long)err);
                break;
            }
        }
        
        NSLog(@"complete");
        
        
    } while (false);
    
    
    if (err != noErr) {
        NSLog(@"err = %ld", (long)err);
    }
    
    //解放する
    if (ioData) free(ioData);
    if (inAudioFileRef) ExtAudioFileDispose(inAudioFileRef);
    if (appendAudioFileRef) ExtAudioFileDispose(appendAudioFileRef);
    if (outAudioFileRef) ExtAudioFileDispose(outAudioFileRef);
    
    // ファイル切り替え
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtURL:inURL error:nil];
    [fileManager moveItemAtURL:outURL toURL: inURL error:&error];
    if (error) {
        NSLog(@"moveItemAtURL error:%@",error);
    }
}
@end
