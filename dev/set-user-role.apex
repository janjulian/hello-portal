User user = new User();
user.Id=UserInfo.getUserId();
user.UserRoleId = [select Id from UserRole where DeveloperName='Admin'].Id;
update user;