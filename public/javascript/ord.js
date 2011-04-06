$(document).ready(function() {
    $("form").submit( function(){        
        var word = $("#query");
        var method = $($("select option:selected"));
        var url = method[0].text +'/'+ word[0].value;
        $.get(url, function(data, textStatus){
            $("#output").html("<code>"+$.toJSON(data)+"</code>");
        });
        return false;
    });
    
});