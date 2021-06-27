trigger ActiveContactTrigger on Contact (after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            ActiveContactTriggerHandler.AfterInsert(Trigger.new);
}
        when AFTER_UPDATE{ 
            ActiveContactTriggerHandler.AfterUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_DELETE{
            ActiveContactTriggerHandler.AfterDelete(Trigger.old);

        }
        when AFTER_UNDELETE{
            ActiveContactTriggerHandler.AfterUndelete(Trigger.new);

        }
    }
}