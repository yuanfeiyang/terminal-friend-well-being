//
//  DuanZi+CoreDataProperties.h
//  TRProject
//
//  Created by spare on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DuanZi.h"

NS_ASSUME_NONNULL_BEGIN

@interface DuanZi (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *time;
@property (nullable, nonatomic, retain) NSString *counts;
@property (nullable, nonatomic, retain) NSString *leftImage;
@property (nullable, nonatomic, retain) NSString *rightImage;
@property (nullable, nonatomic, retain) NSString *number;

@end

NS_ASSUME_NONNULL_END
