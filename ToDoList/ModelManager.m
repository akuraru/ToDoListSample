
#import "ModelManager.h"
#import "CoreData+MagicalRecord.h"

#import "ToDoViewObject.h"
#import "ToDo.h"

@implementation ModelManager

+ (void)setup {
    [MagicalRecord setupCoreDataStack];
}
+ (void)saveContext {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}
+ (void)save {
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
}


+ (void)insertOrUpdateToDo:(ToDoViewObject *)viewObject {
    ToDo *todo = (viewObject.todo) ?: [ToDo MR_createEntity];
    todo.text = viewObject.text;
    
    [self save];
}

+ (NSArray *)readToDo {
    return [ToDo MR_findAll];
}
+ (void)deleteToDo:(ToDo*)todo {
    [todo MR_deleteEntity];
    
    [self save];
}

@end
