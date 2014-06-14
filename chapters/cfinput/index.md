CFINPUT
===

The `<cfinput>` tag has loads of attributes, 46 of them to be precise, although you would never use them all at once.

**Listing 1 : `<cfinput>`**

    <cfinput 
        name = "name"
        autosuggest = "list or bind expression"
        autosuggestBindDelay = "integer number if seconds"
        autosuggestMinLength = "integer"
        bind = "bind expression"
        bindAttribute = "attribute name"
        bindOnLoad = "no|yes"
        checked = "yes|no"
        dayNames = "day of week labels separated by commas"
        delimiter = "character"
        disabled = "disabled"
        enabled = "yes|no"
        firstDayOfWeek = "day name"
        height = "number of pixels"
        id = "HTML id"
        label = "text"
        mask = "masking pattern"
        maxLength = "number"
        maxResultsDisplayed = "number"
        message = "text"
        monthNames = "month labels"
        onBindError = "JavaScript function name"
        onChange = "JavaScript or ActionScript"
        onClick = "JavaScript or ActionScript"
        onError = "script name"
        onKeyDown = "JavaScript or ActionScript"
        onKeyUp = "JavaScript or ActionScript"
        onMouseDown = "JavaScript or ActionScript"
        onMouseUp = "JavaScript or ActionScript"
        onValidate = "script name"
        pattern = "regular expression"
        range = "minimum value, maximum value"
        required = "yes|no"
        showAutosuggestLoadingIcon = "yes|no"
        size = "integer"
        sourceForToolTip = "URL"
        src = "image URL"
        style = "style specification"
        tooltip = "text"
        type = "input type"
        typeahead = "no|yes"
        validate = "data type"
        validateAt = "onBlur|onServer|onSubmit"
        value = "initial value"
        visible = "yes|no"
        width = "integer number of pixels"
    >

We really want to replace all our old `<cfinput>` tags with plain HTML `<input>` tags.

Here's how :-

<table>
    <tr>
        <td><strong>Attribute</strong></td>
        <td><strong>Usage</strong></td>
        <td><strong>Alternative</strong></td>
    </tr>
    <tr>
        <td>name</td>
        <td>name</td>
        <td>Use the HTML name attribute in the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>autosuggest</td>
        <td>list or bind expression</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest
            </a>
        </td>
    </tr>
    <tr>
        <td>autosuggestBindDelay</td>
        <td>integer number if seconds</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest
            </a>
        </td>
    </tr>
    <tr>
        <td>autosuggestMinLength</td>
        <td>integer</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest
            </a>
        </td>
    </tr>
    <tr>
        <td>bind</td>
        <td>bind expression</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest ( js does the binding )
            </a>
        </td>
    </tr>
    <tr>
        <td>bindAttribute</td>
        <td>attribute name</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest ( js does the binding )
            </a>
        </td>
    </tr>
    <tr>
        <td>bindOnLoad</td>
        <td>no|yes</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest ( js does the binding )
            </a>
        </td>
    </tr>
    <tr>
        <td>checked</td>
        <td>yes|no</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>dayNames</td>
        <td>day of week labels separated by commas</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfcalendar">
                CF-UI cfcalendar
            </a>
        </td>
    </tr>
    <tr>
        <td>delimiter</td>
        <td>character</td>
        <td>N/A. Each alternative will deal with it's own delimeters</td>
    </tr>
    <tr>
        <td>disabled</td>
        <td>disabled</td>
        <td>Use the HTML disabled attribute in the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>enabled</td>
        <td>yes|no</td>
        <td>The equivalent of removing the disabled tag from the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>firstDayOfWeek</td>
        <td>day name</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfcalendar">
                CF-UI cfcalendar
            </a>
        </td>
    </tr>
    <tr>
        <td>height</td>
        <td>number of pixels</td>
        <td>use CSS. i.e. #input-box { height: 200px;}</td>
    </tr>
    <tr>
        <td>id</td>
        <td>HTML id</td>
        <td>Use the HTML id attribute in the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>label</td>
        <td>text</td>
        <td>Use the HTML <label> element</td>
    </tr>
    <tr>
        <td>mask</td>
        <td>masking pattern</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfcalendar">
                CF-UI cfcalendar
            </a>
        </td>
    </tr>
    <tr>
        <td>maxLength</td>
        <td>number</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>maxResultsDisplayed</td>
        <td>number</td>
        <td>N/A. Each alternative will deal with it's own max results</td>
    </tr>
    <tr>
        <td>message</td>
        <td>text</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>monthNames</td>
        <td>month labels</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfcalendar">
                CF-UI cfcalendar
            </a>
        </td>
    </tr>
    <tr>
        <td>onBindError</td>
        <td>JavaScript function name</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest
            </a>
        </td>
    </tr>
    <tr>
        <td>onChange</td>
        <td>JavaScript or ActionScript</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>onClick</td>
        <td>JavaScript or ActionScript</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>onError</td>
        <td>script name</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>onKeyDown</td>
        <td>JavaScript or ActionScript</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>onKeyUp</td>
        <td>JavaScript or ActionScript</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>onMouseDown</td>
        <td>JavaScript or ActionScript</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>onMouseUp</td>
        <td>JavaScript or ActionScript</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-events">
                CF-UI cfinput-events
            </a>
        </td>
    </tr>
    <tr>
        <td>onValidate</td>
        <td>script name</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>pattern</td>
        <td>regular expression</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>range</td>
        <td>minimum value, maximum value</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>required</td>
        <td>yes|no</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>showAutosuggestLoadingIcon</td>
        <td>yes|no</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest
            </a>
        </td>
    </tr>
    <tr>
        <td>size</td>
        <td>integer</td>
        <td>Use CSS. i.e. #input-box { width: 200px;}</td>
    </tr>
    <tr>
        <td>sourceForToolTip</td>
        <td>URL</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/blob/master/chapters/cftooltip/index.md">
                CF-UI cftooltip
            </a>
        </td>
    </tr>
    <tr>
        <td>src</td>
        <td>image URL</td>
        <td>Use the HTML image attribute in the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>style</td>
        <td>style specification</td>
        <td>Use CSS</td>
    </tr>
    <tr>
        <td>tooltip</td>
        <td>text</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/blob/master/chapters/cftooltip/index.md">
                CF-UI cftooltip
            </a>
        </td>
    </tr>
    <tr>
        <td>type</td>
        <td>input type</td>
        <td>Use the HTML type attribute in the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>typeahead</td>
        <td>no|yes</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfinput-autosuggest">
                CF-UI cfinput-autosuggest
            </a>
        </td>
    </tr>
    <tr>
        <td>validate</td>
        <td>data type</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>validateAt</td>
        <td>onBlur|onServer|onSubmit</td>
        <td>
            <a href="https://github.com/cfjedimaster/ColdFusion-UI-the-Right-Way/tree/master/chapters/cfform-validate">
                CF-UI cfform-validate
            </a>
        </td>
    </tr>
    <tr>
        <td>value</td>
        <td>initial value</td>
        <td>Use the HTML value attribute in the &lt;input&gt; element</td>
    </tr>
    <tr>
        <td>visible</td>
        <td>yes|no</td>
        <td>Use CSS. i.e. #input-box { display: none;} OR #input-box { display: block;}</td>
    </tr>
    <tr>
        <td>width</td>
        <td>integer number of pixels</td>
        <td>Use CSS. i.e. #input-box { width: 200px;}</td>
    </tr>
</table>

There is a link or an explanation for each of the `<cfinput>` attributes.

For further information you can reference :-

* [CFINPUT](http://livedocs.adobe.com/coldfusion/8/htmldocs/help.html?content=Tags_i_07.html)





