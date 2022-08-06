//
//  ListItem.m
//  SampleApp
//
//  Created by xiaofeng on 2022/8/6.
//

#import "ListItem.h"

@implementation ListItem

- (void) configWithDictionary:(NSDictionary *) dictionary {
    
    #warning type match
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniqueKey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
