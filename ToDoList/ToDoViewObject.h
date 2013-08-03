
#import <Foundation/Foundation.h>

@class ToDo;

@interface ToDoViewObject : NSObject

@property (nonatomic) NSString *text;
@property (nonatomic, readonly) ToDo *todo;

- (id)initWithToDo:(ToDo *)todo;

@end
