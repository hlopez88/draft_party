
var runningBacks = [];
var quarterBacks = [];
var wideRecievers = [];
var tightEnds = [];
var defenses = [];
var kickers = [];
var fantasyTeams = [];
var teamDraftList = [];   
var draftPicks = [];
var currentTeam =0;
var snakeUp=true;

function initializePlayers()
{
    $.get("/players.json",function(json_obj,status)
    {
       // var json_obj= $.parseJSON(data);
        for (var i in json_obj) 
        {
            if(json_obj[i].position == "QB")
                quarterBacks.push(json_obj[i].name);
            else if(json_obj[i].position === "RB")
                runningBacks.push(json_obj[i].name);
            else if(json_obj[i].position === "WR")
                wideRecievers.push(json_obj[i].name);
            else if(json_obj[i].position === "TE")
                tightEnds.push(json_obj[i].name);
            else if(json_obj[i].position === "DEF")
                defenses.push(json_obj[i].name);
            else if(json_obj[i].position === "K")   
                kickers.push(json_obj[i].name);

        } 
    });
}

function beginDraft()
{
    document.getElementById("available_picks").innerHTML="<h3>Available Picks:</h3><p id=\"submit_selection\"></p> <table><tr><td valign=\"top\" id=\"availQBs\"></td><td valign=\"top\" id=\"availRBs\"></td><td valign=\"top\" id=\"availWRs\"></td><td valign=\"top\" id=\"availTEs\"></td><td valign=\"top\" id=\"availDEs\"></td><td valign=\"top\" id=\"availKs\"></td></tr></table>";

    updateAvailablePlayers("availQBs",0);
    updateAvailablePlayers("availRBs",1);
    updateAvailablePlayers("availWRs",2);
    updateAvailablePlayers("availTEs",3);
    updateAvailablePlayers("availDEs",4);
    updateAvailablePlayers("availKs",5);

    $("#available_picks").hide().show(1000);

    $("#create_teams").hide(1000);
}

function addTeam(frm)
{
    if(frm.team_name.value=="")
        return false;

    fantasyTeams.push(frm.team_name.value);
    frm.reset();
    listTeams();
    return false;
}

function onSubmit(index,position)
{

    var players=null, pos=null;
    switch(position)
    {
        case 0:
            players=quarterBacks;
            pos="QB";
            break;
        case 1:
            players=runningBacks;
            pos="RB";
            break;
        case 2:
            players=wideRecievers;
            pos="WR";
            break;
        case 3:
            players=tightEnds;
            pos="TE";
            break;  
        case 4:
            players=defenses;
            pos="DE";
            break;    
        case 5:
            players=kickers;
            pos="K";
            break;        
    }

    updateDraftPicks(players[index]);
    updateTeam(players[index],pos);

    players.splice(index,1);
    updateAvailablePlayers("avail"+pos+"s",position);

    if(snakeUp)
    {
        if(++currentTeam == fantasyTeams.length)
        { 
            --currentTeam;
            snakeUp=!snakeUp;
        }
    }
    else
    {
        if(currentTeam == 0)
            snakeUp=!snakeUp;
        else
            currentTeam--;    
    }

    document.getElementById("submit_selection").innerHTML="Current Selection: "
}



function updateDraftPicks(name)
{
    draftPicks.push(name);

    var text ="<h3>Drafted Players:</h3> <table class='ftsy_teams_table'><tr><th colspan=\"100\">Draft Picks</th></tr><tr>";

    for(var n=0; n < (Math.ceil(draftPicks.length/10)); n++)
    {   
        text+="<th>No.</th><th>Name</th>";
    }

    text+="</tr>";

    var rows =[];
    for(var i =0 ; i<draftPicks.length; i++)
    {
        var pickNo=i+1;
        var row=i%10;

        if(rows[row]==null)
            rows[row]="<td>"+pickNo+"</td><td>"+draftPicks[i]+"</td>";
        else
            rows[row]+="<td>"+pickNo+"</td><td>"+draftPicks[i]+"</td>";
    }

    for(var j=0; j<rows.length; j++)
    {
        if((j+1)%2==0)
            text+="<tr class='alt' valign='top'>";
        else
            text+="<tr valign='top'>";

        text+=rows[j]+"</tr>";
    }

    text+="</table>";

   $("#draft_picks").html(text);

   if(draftPicks.length==1)
        $("#draft_picks").hide().show(1000);


}

function onSelection(name, index, position)
{
    document.getElementById("submit_selection").innerHTML="Current Selection: " +name + "<button onClick=\"onSubmit("+index+","+position+")\">Submit</button>";      
}



function updateAvailablePlayers(obj_id, position)
{
    var players=null, pos=null;

    switch(position)
    {
        case 0:
            players=quarterBacks;
            pos="Quarterbacks";
            break;
        case 1:
            players=runningBacks;
            pos="Running Backs";
            break;
        case 2:
            players=wideRecievers;
            pos="Wide Recievers";
            break;
        case 3:
            players=tightEnds;
            pos="Tight Ends";
            break;  
        case 4:
            players=defenses;
            pos="Defenses";
            break;    
        case 5:
            players=kickers;
            pos="Kickers";
            break;        
    }

    var text ="<table class=\"ftsy_teams_table\"><thead><tr><th>"+pos+"</th></tr></thead><tbody class='scrollable_tbody'>";
    for(var i=0; i<players.length; i++)
    {
        var tmp=i +1;
        if(tmp%2==0)
            text+="<tr class=\"alt\">";
        else
            text+="<tr>";
        text+="<td onmouseover=\"this.bgColor='#99FF33'\" onmouseout=\"this.bgColor='white'\"  onClick=\"onSelection('"+players[i]+"',"+i+","+position+");\">"+players[i]+"</td></tr>";
    }

    text+="</tbody></table>";

    document.getElementById(obj_id).innerHTML= text; 
}


function updateTeam(name, position)
{
    teamDraftList[currentTeam].push({pos:position, name:name});
    document.getElementById("team"+currentTeam.toString()).innerHTML= listTeam(fantasyTeams[currentTeam], teamDraftList[currentTeam]);
}

function listTeams()
{
    var text = " <h3>Fantasy Teams:</h3><table><tr>";

    for(var i in fantasyTeams)
    {
        var tmp=parseInt(i);
        if(tmp>0 && tmp % 5==0)
            text+="</tr><tr>";

        text+="<td valign=\"top\" id=\"team"+i+"\">"+listTeam(fantasyTeams[i],teamDraftList[i])+"</td>";
        teamDraftList[i]=[];
    }

    text+="</tr></table>";
    $("#fantasy_teams").html(text);
    $(".ftsy_teams").last().hide().fadeIn(1000);
}


function listTeam(coach, players)
{
    var text ="<table class='ftsy_teams_table'><tr><th colspan=\"3\">"+coach+"</th></tr><tr><th>No.</th><th>Position</th><th>Name</th></tr>";
    for(var i in players)
    {
        var pickNo=parseInt(i)+1;

        if(pickNo%2==0)
            text+="<tr class=\"alt\">";
        else
            text+="<tr>";
        text+="<td>"+pickNo+"</td><td>"+players[i].pos+"</td><td>"+players[i].name+"</td></tr>";
    }

    text+="</table>";

    return text;
}
