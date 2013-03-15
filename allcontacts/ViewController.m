//
//  ViewController.m
//  allcontacts
//
//  Created by Eworks on 13/03/13.
//  Copyright (c) 2013 Eworks. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnContacts:(id)sender {

    
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            // First time access has been granted, add the contact
//            [self _addContactToAddressBook];
            CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople( addressBookRef );
            CFIndex nPeople = ABAddressBookGetPersonCount(addressBookRef );
            NSLog(@"contacts =%ld",nPeople);
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        // The user has previously given access, add the contact
//        [self _addContactToAddressBook];
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople( addressBookRef );
        CFIndex nPeople = ABAddressBookGetPersonCount(addressBookRef );
        NSLog(@"contacts =%ld",nPeople);
    }
    else {
        // The user has previously denied access
        // Send an alert telling user to change privacy setting in settings app
    }
    
    //
//    ABAddressBookRef addressBook = ABAddressBookCreate(); // create address book reference object
//    NSArray *abContactArray = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook); // get address book contact array
//    
//    NSInteger totalContacts =[abContactArray count];
//    NSLog(@" totalContacts= %d",totalContacts);
//    for(NSUInteger loop= 0 ; loop < totalContacts; loop++)
//    {
//        ABRecordRef record = (__bridge ABRecordRef)[abContactArray objectAtIndex:loop]; // get address book record
//        
//        if(ABRecordGetRecordType(record) ==  kABPersonType) // this check execute if it is person group
//        {
//            ABRecordID recordId = ABRecordGetRecordID(record); // get record id from address book record
//            
//            NSString *recordIdString = [NSString stringWithFormat:@"%d",recordId]; // get record id string from record id
//            
//            NSString *firstNameString = (__bridge NSString*)ABRecordCopyValue(record,kABPersonFirstNameProperty); // fetch contact first name from address book
//            NSString *lastNameString = (__bridge NSString*)ABRecordCopyValue(record,kABPersonLastNameProperty); // fetch contact last name from address book
//            NSLog(@" Contacts %@ %@ %@",recordIdString, firstNameString, lastNameString);
//        }
//    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
