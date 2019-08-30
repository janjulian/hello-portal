public Profile queryProfile()
{
    return [select Id from Profile where Name ='Partner Community User' limit 1];
}

public PermissionSet queryPermissionSet()
{
    return [select id, name from permissionset where name='Portal_Readonly'][0];
}

public List<Contact> queryContacts()
{
    return [select Id, FirstName, LastName, Email from Contact where Account.IsPartner = true];
}

public User newUser(Contact contact, Profile profile)
{
    User user = new User();
    user.ProfileId = profile.Id;
    user.ContactId = contact.Id;
    user.FirstName = contact.FirstName;
    user.LastName = contact.LastName;
    user.UserName = contact.Email;
    user.Email = contact.Email;
    user.Alias = user.FirstName.left(1) + user.LastName.left(7);
    user.CommunityNickname = (user.FirstName + user.LastName).left(40);  
    user.LanguageLocaleKey = 'en_US';
    user.LocaleSidKey = 'en_CA';
    user.EmailEncodingKey = 'ISO-8859-1';
    user.TimeZoneSidKey = 'America/Los_Angeles';
    return user;
}

public PermissionSetAssignment newAssignment(User user, PermissionSet ps)
{
    PermissionSetAssignment psa = new PermissionSetAssignment();
    psa.AssigneeId = user.Id;
    psa.PermissionSetId = ps.Id;
    return psa;
}

// CREATE USERS

Profile profile = queryProfile();
List<User> users = new List<User>();

for (Contact contact : queryContacts()) 
{
    users.add(newUser(contact, profile));
}

insert users;

// ASSIGN PROFILE PERM SET

// PermissionSet permissionSet = queryPermissionSet();
// List<PermissionSetAssignment> psas = new List<PermissionSetAssignment>();

// for (User user : users) 
// {
//     psas.add(newAssignment(user, permissionSet));
// }

// insert psas;

