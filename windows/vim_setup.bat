rem Important notes re: deleting symbols but not the actual files/directories:
rem http://superuser.com/questions/167076/how-can-i-delete-a-symbolic-linkem

rem Use rmdir to get rid of a directory link.
rmdir %userprofile%\vimfiles
mklink /d %userprofile%\vimfiles "%userprofile%\Google Drive\code\config\.vim"

rem Use del to get rid of a file link.
del %userprofile%\_vimrc
mklink %userprofile%\_vimrc "%userprofile%\Google Drive\code\config\.vimrc"
rem mklink /h %userprofile%\_vimrc "%userprofile%\Google Drive\code\config\.vimrc"
