<!---   
        tblSlideDecks
        =============
        id              -->     UNIQUE DATABASE ID
        deck_id         -->     UNIQUE DECK ID
        name            -->     SLIDE DECK NAME
--->

<cfset tblSlideDecks=queryNew(
    "id,deck_id,name",
    "integer,integer,varchar",
[
    {   
        id:1,
        deck_id:1,
        name:'Original impress.js Demo'
    }
    ,
    {   
        id:2,
        deck_id:2,
        name:'Second Slide Deck'
    }
])>

<!---   
        tblSlides
        =========
        id              -->     UNIQUE DATABASE ID
        deck_id         -->     UNIQUE DECK ID

        // THESE ATTRIBUTES ARE USED BY impress.js
        
        Attr in the DIV             Maps to this column in the database
        ===================         ===================================   
        id                  -->     i_id
        class               -->     i_class     
        data-x              -->     i_data_x
        data-y              -->     i_data_y
        data-z              -->     i_data_z
        data-rotate-x       -->     i_data_rotate_x
        data-rotate-y       -->     i_data_rotate_y
        data-rotate-z       -->     i_data_rotate_z
        data-scale          -->     i_data_scale

        What's with all the NULL values
        ===============================

        When we process the slides we only want the ATTRIBUTES that correspond to the <div> in question .
        
        For example for the first <div> we want,
        
        <div id="bored" class="step slide" data-x="-1000" data-y="-1500">

        INSTEAD OF :-

        <div id="bored" class="step slide" data-x="-1000" data-y="-1500" data-z="" data-rotate-x=""  data-rotate-y="" data-rotate-z="" data-scale="">
--->

<cfset tblSlides=queryNew(
    "id,deck_id,i_id,i_class,i_data_x,i_data_y,i_data_z,i_data_rotate_x,i_data_rotate_y,i_data_rotate_z,i_data_scale,i_content",
    "integer,integer,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar,varchar",
[
    {   
        id:1,
        deck_id:1,
        i_id:'bored',
        i_class:'step slide',
        i_data_x:'-1000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <q>Aren&rsquo;t you just <b>bored</b> with all those slides-based presentations?</q>
            '
    }
    ,
    {   
        id:2,
        deck_id:1,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'0',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <q>Don&rsquo;t you think that presentations given <strong>in modern browsers</strong> shouldn&rsquo;t <strong>copy the limits</strong> of &rsquo;classic&rsquo; slide decks?</q>
            '
    }
    ,
    {   
        id:3,
        deck_id:1,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'1000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <q>Would you like to <strong>impress your audience</strong> with <strong>stunning visualization</strong> of your talk?</q>
            '
    }
    ,
    {   
        id:4,
        deck_id:1,
        i_id:'title',
        i_class:'step',
        i_data_x:'0',
        i_data_y:'0',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'4',
        i_content: 
            '
                <span class="try">then you should try</span><h1>impress.js<sup>*</sup></h1><span class="footnote"><sup>*</sup> no rhyme intended</span>
            '
    }
    ,
    {   
        id:5,
        deck_id:1,
        i_id:'its',
        i_class:'step',
        i_data_x:'850',
        i_data_y:'3000',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'90',
        i_data_scale:'5',
        i_content: 
            '
                <p>It&rsquo;s a <strong>presentation tool</strong> <br/>inspired by the idea behind <a href="http://prezi.com">prezi.com</a><br/>
                and based on the <strong>power of CSS3 transforms and transitions</strong> in modern browsers.</p>
            '
    }
    ,
    {   
        id:6,
        deck_id:1,
        i_id:'big',
        i_class:'step',
        i_data_x:'3500',
        i_data_y:'2100',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'180',
        i_data_scale:'6',
        i_content: 
            '
                <p>visualize your <b>big</b> <span class="thoughts">thoughts</span></p>
            '
    }
    ,
    {   
        id:7,
        deck_id:1,
        i_id:'tiny',
        i_class:'step',
        i_data_x:'2825',
        i_data_y:'2325',
        i_data_z:'-3000',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'300',
        i_data_scale:'1',
        i_content: 
            '
                        <p>and <b>tiny</b> ideas</p>
            '
    }
    ,
    {   
        id:8,
        deck_id:1,
        i_id:'ing',
        i_class:'step',
        i_data_x:'3500',
        i_data_y:'-850',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'270',
        i_data_scale:'6',
        i_content: 
            '
                <p>by <b class="positioning">positioning</b>, <b class="rotating">rotating</b> and <b class="scaling">scaling</b> them on an infinite canvas</p>
            '
    }
    ,
    {   
        id:9,
        deck_id:1,
        i_id:'imagination',
        i_class:'step',
        i_data_x:'6700',
        i_data_y:'-300',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'6',
        i_content: 
            '
                <p>the only <b>limit</b> is your <b class="imagination">imagination</b></p>
            '
    }
    ,
    {   
        id:10,
        deck_id:1,
        i_id:'source',
        i_class:'step',
        i_data_x:'6300',
        i_data_y:'2000',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'20',
        i_data_scale:'4',
        i_content: 
            '
                <p>want to know more?</p><q><a href="http://github.com/bartaz/impress.js">use the source</a>, Luke!</q>
            '
    }
    ,
    {   
        id:11,
        deck_id:1,
        i_id:'one-more-thing',
        i_class:'step',
        i_data_x:'6000',
        i_data_y:'4000',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'2',
        i_content: 
            '
                <p>one more thing...</p>
            '
    }
    ,    
    {   
        id:12,
        deck_id:1,
        i_id:'its-in-3d',
        i_class:'step',
        i_data_x:'6200',
        i_data_y:'4300',
        i_data_z:'-100',
        i_data_rotate_x:'-40',
        i_data_rotate_y:'10',
        i_data_rotate_z:'null',
        i_data_scale:'2',
        i_content: 
            '
                <p>
                    <span class="have">have</span>
                    <span class="you">you</span>
                    <span class="noticed">noticed</span>
                    <span class="its">it&rsquo;s</span>
                    <span class="in">in</span><b>3D<sup>*</sup></b>?
                </p>
                <span class="footnote">* beat that, prezi ;)</span>
            '
    } 
    ,
    {   
        id:13,
        deck_id:1,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'2000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
               <a href="index.cfm">CLOSE<a>
            '
    }
    ,    
    {   
        id:14,
        deck_id:1,
        i_id:'overview',
        i_class:'step',
        i_data_x:'3000',
        i_data_y:'1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'10',
        i_content: ''
    }
    ,
    {   
        id:15,
        deck_id:2,
        i_id:'bored',
        i_class:'step slide',
        i_data_x:'-1000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <h1>CFPRESENTATION</h1>
                <q>The <code>&lt;cfpresentation&gt;</code> tag lets you present stuff.</q>
                <q>So here I am going to use <a href="http://bartaz.github.io/impress.js/##/bored">impress.js</a> to do the presentations.</q>
            '
    }
    ,
    {   
        id:16,
        deck_id:2,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'0',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <q>I have included the <strong>original</strong> <a href="http://bartaz.github.io/impress.js/##/bored">impress.js</a> demonstration so that the code comments for ALL the code are included.</q>
                <q>We shall begin.</q>
            '
    }
    ,
    {   
        id:17,
        deck_id:2,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'1000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <q>When the index page loads we run the following CFML :-</q>
                <br />
                <pre><code>&lt;cfset objContent = createObject("component", "cfc.content") /&gt;</pre>
                <pre>&lt;cfset qryDecks = objContent.srcSlideDecks() /&gt;</pre>
                </code></pre>
            '
    }
    ,            
    {   
        id:18,
        deck_id:2,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'2000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <q>This obtains our Slide Deck data.</q>
                <q>Now we just loop over the Slide Deck data and create some buttons.</q>
                <img src="images/buttons.png" alt="Buttons" style="align:center;">
            '
    }
    ,            
    {   
        id:19,
        deck_id:2,
        i_id:'null',
        i_class:'step slide',
        i_data_x:'3000',
        i_data_y:'-1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'null',
        i_content: 
            '
                <a href="index.cfm">CLOSE</a>
            '
    }
    , 
    {   
        id:20,
        deck_id:2,
        i_id:'overview',
        i_class:'step',
        i_data_x:'4000',
        i_data_y:'1500',
        i_data_z:'null',
        i_data_rotate_x:'null',
        i_data_rotate_y:'null',
        i_data_rotate_z:'null',
        i_data_scale:'10',
        i_content: ''
    }
])>
