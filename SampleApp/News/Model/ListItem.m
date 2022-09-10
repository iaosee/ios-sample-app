//
//  ListItem.m
//  SampleApp
//
//  Created by iaosee on 2022/8/6.
//

#import "ListItem.h"

@implementation ListItem

- (instancetype)initWithCoder:(NSCoder *) decoder {
    self = [super init];
    if (self) {
        self.category = [decoder decodeObjectForKey:@"category"];
        self.picUrl = [decoder decodeObjectForKey:@"picUrl"];
        self.uniqueKey = [decoder decodeObjectForKey:@"uniqueKey"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.authorName = [decoder decodeObjectForKey:@"authorName"];
        self.articleUrl = [decoder decodeObjectForKey:@"articleUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void) configWithDictionary:(NSDictionary *) dictionary {
    
    #warning type match
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"imgsrc"];
    self.uniqueKey = [dictionary objectForKey:@"postid"];
    self.title = [dictionary objectForKey:@"title"];
    self.digest = [dictionary objectForKey:@"digest"];
    self.date = [dictionary objectForKey:@"ptime"];
    self.authorName = [dictionary objectForKey:@"source"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
