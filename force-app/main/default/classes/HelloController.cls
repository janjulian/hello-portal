public with sharing class HelloController {

    @AuraEnabled
    public static List<Name__c> getNames() {
        return [select Name, Sort_Order__c from Name__c order by Sort_Order__c asc, Name asc];
    }
}
