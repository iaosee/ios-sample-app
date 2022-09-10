//
//  NSString+Hash.h
//  SampleApp
//
//  Created by iaosee on 2022/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Hash)

/**
 Creates a MD5 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) MD5;

/**
 Creates a MD5 hash of the current string as NSData representation.
 */
- (nonnull NSData*) MD5Data;

/**
 Creates a SHA1 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) SHA1;

/**
 Creates a SHA1 hash of the current string as NSData representation.
 */
- (nonnull NSData*) SHA1Data;

/**
 Creates a SHA256 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) SHA256;

/**
 Creates a SHA256 hash of the current string as NSData representation.
 */
- (nonnull NSData*) SHA256Data;

/**
 Creates a SHA512 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) SHA512;

/**
 Creates a SHA512 hash of the current string as NSData representation.
 */
- (nonnull NSData*) SHA512Data;

@end

NS_ASSUME_NONNULL_END
