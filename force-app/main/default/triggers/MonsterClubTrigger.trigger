trigger MonsterClubTrigger on Monster_Club__c (before insert, before update, before delete, 
                                        after insert, after update, after delete) {
   
    System.debug(LoggingLevel.DEBUG, '---> Trigger isInsert' + Trigger.isInsert);
    System.debug(LoggingLevel.DEBUG, '---> Trigger isUpdate' + Trigger.isUpdate);
    System.debug(LoggingLevel.DEBUG, '---> Trigger isDelete' + Trigger.isDelete);
    System.debug(LoggingLevel.DEBUG, '---> Trigger isAfter' + Trigger.isAfter);
    System.debug(LoggingLevel.DEBUG, '---> Trigger isBefore' + Trigger.isBefore);
    System.debug(LoggingLevel.DEBUG, '---> Trigger Operation' + TriggerOperation.values());
    System.debug(LoggingLevel.DEBUG, '---> Trigger data' + Trigger.newMap);

    for(Monster_Club__c record : Trigger.new) {
        if(Trigger.isBefore) {
            record.Name = record.Name + ' - ' + String.valueOf(System.today());
        }

    }
}