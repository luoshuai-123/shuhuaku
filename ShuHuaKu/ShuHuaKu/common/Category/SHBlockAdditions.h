//
//  QMBlockAdditions.h
//  Juanpi_2.0
//
//  Created by luoshuai on 14-2-24.
//  Copyright (c) 2014年 Juanpi. All rights reserved.
//

typedef void (^VoidBlock)();

typedef void (^DismissBlock)(NSNumber *buttonIndex);
typedef void (^CancelBlock)();
typedef void (^ClassBlock)(id classData);
typedef void (^PhotoPickedBlock)(UIImage *chosenImage);
typedef id (^getClassBlock)();
typedef void (^ClickBlock)();
#define kPhotoActionSheetTag 10000