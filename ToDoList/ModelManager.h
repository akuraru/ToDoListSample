
#import <Foundation/Foundation.h>

@class ToDoViewObject;
@class ToDo;

@interface ModelManager : NSObject

+ (void)setup;
+ (void)saveContext;

+ (void)insertOrUpdateToDo:(ToDoViewObject *)viewObject;
+ (NSArray *)readToDo;
+ (void)deleteToDo:(ToDo*)todo;

@end
