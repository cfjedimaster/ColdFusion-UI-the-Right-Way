$(document).ready(function() {
    //IGNORE dragover EVENT
    $('#dropFiles').on(
        'dragover',
        function(e) {
            e.preventDefault();
            e.stopPropagation();
        }
    );
    //IGNORE dragenter EVENT
    $('#dropFiles').on(
        'dragenter',
        function(e) {
            e.preventDefault();
            e.stopPropagation();
        }
    );
    //PROCESS the change EVENT WHEN FILES ARE CHOSEN VIA THE BUTTON
    $('#btnChooseFiles').on ('change', function(e) {
        e.preventDefault();
        e.stopPropagation();
        var files = $('#btnChooseFiles').prop("files");
        clearMessages();
        uploadFiles(files);
    });
    // PROCESS THE drop EVENT WHEN FILES ARE DROPPED
    $('#dropFiles').on ('drop', function(e) {
        e.preventDefault();
        e.stopPropagation();
        var files = event.dataTransfer.files;
        clearMessages();
        uploadFiles(files);
    });
    // UPLOAD THE FILES
    function uploadFiles(filesCollection){
        // ALLOWED FILE TYPES
        var allowedFileTypes = ['image/jpeg','image/png','image/gif']
        // NUMBER OF FILES BEING UPLOADED
        var numberOfFiles = filesCollection.length;
        // LOOP OVER THE FILES
        for (var i=0;i < numberOfFiles; i++) {
            // GET THE FILE INFO
            var fileName = filesCollection[i].name;
            var fileSize = filesCollection[i].size;
            var fileType = filesCollection[i].type;
            // WHAT TYPE OF FILES ARE WE GOING TO ALLOW
            var found = $.inArray(fileType, allowedFileTypes) > -1;
            if (found){
                // DEFINE A FORM BECAUSE WE DON'T HAVE ONE
                var newForm = new FormData();
                newForm.append("fileToUpload", filesCollection[i]);
                newForm.append("fileName", fileName);
                // DEFINE THE XMLHttpRequest OBJECT
                var xhr = new XMLHttpRequest();
                // DISPLAY MESSAGE THAT FILE IS BEING UPLOADED
                message('uploading',fileName,fileSize,fileType);
                // LISTEN TO THE "load" EVENT AND DISPLAY MESSAGE WHEN THE EVENT FIRES
                xhr.addEventListener("load", message('complete',fileName,fileSize,fileType),true);
                // OPEN CONNECTION TO upload.cfm (method, file, asynch)
                xhr.open("post", "upload.cfm", true);
                // SEND THE FILE
                xhr.send(newForm);
            }
            else {
                // IF THE MIME TYPE IS NOT IN OUR ALLOWED COLLECTION THEN SHOW AN ERROR
                message('error',fileName,fileSize,fileType);
            }
        }
        //CLEAR THE FILES READY FOR THE NEXT UPLOAD
        clearFiles();
    }
    // CLEAR ALL MESAGES
    function clearMessages(){
        $('.uploadLog').html('');
    }    
    // CLEAR ALL FILES
    function clearFiles(){
        //CLEAR THE FILES SO THAT WE START AFRESH WITH NO FILES AT ALL
        $("#dropFiles").value = null;
        $("#btnChooseFiles").value = null;
        //CLEAR THE FILES NAMES ( OR NO. OF FILES ) FROM THE INPUT BOX
        $("#btnChooseFiles").val('');
    }
    //DISPLAY A MESSAGES
    function message(messageId,fileName,fileSize,fileType){
        // FORMAT THE MESSAGE
        var messageText = '';
        if(messageId === 'uploading') {
            messageText = 'Uploading :- ' + fileName + ' (' + fileSize + ')';
        }
        if(messageId === 'complete') {
            messageText = fileName + ' (' + fileSize + ')' + ' successfully uploaded';
        }
        if(messageId === 'error') {
            messageText = fileName + ' is an invalid file type (' + fileType + ')';
        }
        //BUILD THE <li>
         messageElement = '<li class="' + messageId + '">' + messageText + '</li>';
        // SHOW THE CURRENT MESSAGE
        $('.uploadLog').append(messageElement);
    }
});
