<cfparam name="Form.startdate" default="#dateformat(now()-5, 'dd/mm/yyyy')#">
<cfparam name="Form.enddate" default="#dateformat(now()-1, 'dd/mm/yyyy')#">
<cfparam name="Form.selectdate" default="#dateformat(now(), 'dd/mm/yyyy')#">
<cfif isDefined("Form.submitit")>
    <cfoutput><b>You selected #Form.selectedDate#</b><br><br></cfoutput>
</cfif>
<b>Please select a date on the calendar and click Save.</b><br>
<br>
<cfform name="form1" format="Flash" skin="haloBlue" width="375" height="350" >
    <cfcalendar name="selectedDate" 
        selectedDate="#Form.selectdate#"
        startRange="#Form.startdate#"
        endRange="#Form.enddate#" 
        mask="mmm dd, yyyy" 
        dayNames="SU,MO,TU,WE,TH,FR,SA"
        monthNames="JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC"
        style="rollOverColor:##FF0000"
        width="200" 
        height="150">
    <cfinput type="dateField" name="startdate"  label="Block out starts"  width="100" value="#Form.startdate#">
    <cfinput type="dateField" name="enddate"    label="Block out ends"    width="100" value="#Form.enddate#">
    <cfinput type="dateField" name="selectdate" label="Initial date"      width="100" value="#Form.selectdate#">
    <cfinput type="Submit" name="submitit" value="Save" width="100"> 
</cfform>