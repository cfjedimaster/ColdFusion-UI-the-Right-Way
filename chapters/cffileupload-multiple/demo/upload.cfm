<cfset allowedFileTypes = 'image/jpeg,image/png,image/gif'>
<cffile  action="upload" destination="#expandPath('uploads/')#" accept="#allowedFileTypes#" nameconflict="overwrite" filefield="fileToUpload" />
