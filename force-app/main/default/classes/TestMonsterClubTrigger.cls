@isTest
public with sharing class TestMonsterClubTrigger {

    @TestSetup
    static void makeMonsterClubData(){

        Contact con = new Contact();
        con.LastName = 'Frank';
        con.FirstName = 'Ben';
        insert con;

        List<Monster_club__c> records = new List<Monster_club__c>();
        Monster_club__c mc = new Monster_club__c();
        mc.Name = 'Test Party';
        mc.Status__c = 'Not Started';
        mc.Club_Activity__c = 'Stomp around the house';
        mc.Contact__c = con.Id;
        records.add(mc);
        insert records;
    }
    @isTest
    static void test_create_monsterClubRecord() {
        Test.startTest();
            List<Monster_club__c> records = [SELECT Id, Name from Monster_club__c LIMIT 1];
        	records[0].Name = 'Test Party 1';
        	update records;
        Test.stopTest();
        System.assertEquals('Test Party 1' + ' - ' + String.valueOf(System.today()) , records[0].Name, 'Names do not match');
    }
}