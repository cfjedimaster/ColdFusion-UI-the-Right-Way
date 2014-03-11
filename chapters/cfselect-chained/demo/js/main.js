$(document).ready(function(){
    function resetSelect(elemIdName,elemIdDefault,elemValueDefault){
        var sel = '<select id="' + elemIdName + '">';
        sel += '<option value="' + elemIdDefault + '">' + elemValueDefault + '</option>';
        sel += '</select>';
        $('#' + elemIdName).replaceWith(sel);
    }
    function chainedSelect(elemIdName,elemIdDefault,elemValueDefault,cfc,method,table,idCol,valueCol,distinct,selected,colToSearch,format){
        var strURL = cfc + '.cfc?';                 //CFC TO BE CALLED
        strURL += 'method=' + method;               //METHOD TO USE
        strURL += '&strTableName=' + table;         //TABLE NAME TO SELECT RECORDS FROM
        strURL += '&strID=' + idCol;                //COLUMN USED TO POPULATE THE SELECT VALUE
        strURL += '&strName=' + valueCol;           //COLUMN USED TO POPULATE THE SELECT TEXT
        strURL += '&intDistinct=' + distinct;       //USE DISTINCT IN QUERY 0/1 (TRUE/FALSE)
        strURL += '&selectedID=' + selected;        //VALUE OF THE SELECT
        strURL += '&selectedCol=' + colToSearch;    //COLUMN TO SEARCH USING THE selectedID
        strURL += '&ReturnFormat=' + format;        //RETURN FORMAT
        $.ajax({
            url: strURL,
            dataType: 'json',
            success: function(response){
                var i;
                var sel = '<select id="' + elemIdName + '">';
                sel += '<option value="' + elemIdDefault + '">' + elemValueDefault + '</option>';
                //BUILD SELECT
                for (i = 0; i < response.DATA.length; i++){
                    sel += '<option value="';
                    sel += response.DATA[i][0];
                    sel +=  '">';
                    sel += response.DATA[i][1];
                    sel += '</option>';
                }
                sel += '</select>';
                $('#' + elemIdName).replaceWith(sel);
            },
            error: function(ErrorMsg){
                console.log('Error');
            }
        })
    }

    //CONTINENT SELECT - CHANGE HANDLER
    $('body').on('change', '#idContinent', function(e) {
        var strSelected = $("#idContinent").val();
        chainedSelect(
            'idCountry',        //SELECT BOX ID  
            0,                  //SELECT BOX DEFAULT VALUE
            'Select Country',   //SELECT BOX DEFAULT TEXT
            'content',          //CFC TO BE CALLED
            'getContent',       //METHOD TO USE
            'tblCountry',       //TABLE NAME TO SELECT RECORDS FROM
            'code',             //COLUMN USED TO POPULATE THE SELECT VALUE
            'name',             //COLUMN USED TO POPULATE THE SELECT TEXT
            0,                  //USE DISTINCT IN QUERY 0/1 (TRUE/FALSE)
            strSelected,        //VALUE OF THE SELECT
            'continent_id',     //COLUMN TO SEARCH USING THE strSelected
            'json'              //RETURN FORMAT
        );
        resetSelect('idCity',0,'Select City');
    });

    //COUNTRY SELECT - CHANGE HANDLER
    $('body').on('change', '#idCountry', function(e){
        var strSelected = $("#idCountry").val();
        chainedSelect(
            'idCity',       //SELECT BOX ID  
            0,              //SELECT BOX DEFAULT VALUE
            'Select City',  //SELECT BOX DEFAULT TEXT
            'content',      //CFC TO BE CALLED
            'getContent',   //METHOD TO USE
            'tblCity',      //TABLE NAME TO SELECT RECORDS FROM
            'code',         //COLUMN USED TO POPULATE THE SELECT VALUE
            'name',         //COLUMN USED TO POPULATE THE SELECT TEXT
            0,              //USE DISTINCT IN QUERY 0/1 (TRUE/FALSE)
            strSelected,    //VALUE OF THE SELECT
            'code',         //COLUMN TO SEARCH USING THE strSelected
            'json'          //RETURN FORMAT
        );
    });

    //INITIALISE THE SELECTS
    chainedSelect(
        'idContinent',      //SELECT BOX ID  
        0,                  //SELECT BOX DEFAULT VALUE
        'Select Continent', //SELECT BOX DEFAULT TEXT
        'content',          //CFC TO BE CALLED
        'getContent',       //METHOD TO USE
        'tblContinent',     //TABLE NAME TO SELECT RECORDS FROM
        'id',               //COLUMN USED TO POPULATE THE SELECT VALUE
        'name',             //COLUMN USED TO POPULATE THE SELECT TEXT
        1,                  //USE DISTINCT IN QUERY 0/1 (FALSE/TRUE)
        0,                  //VALUE OF THE SELECT
        'id',               //COLUMN TO SEARCH USING THE strSelected
        'json'              //RETURN FORMAT
    );
});