//tt = self.setTimeout(displayTime,1);
var i=5;

function displayTime()
{
    document.getElementById("btnApply").disabled = true;
    document.getElementById("readTime").style.display = "";
    document.getElementById("readTime").innerText = "("+i+")";
    self.setTimeout(addTime,1000);
}

function addTime()
{
    if(i==1)
    {
        document.getElementById("btnApply").disabled = false;
        document.getElementById("readTime").style.display = "none";
        self.clearTimeout(tt);
    }
    else
    {
        i--;
        document.getElementById("readTime").innerText = "("+i+")";
        self.setTimeout(addTime,1000);
    }
}

function btnAccept()
{
    var obj = document.getElementById("pop");
    if(obj!=null && obj!=undefined)
        obj.style.display = "none";
    return false;
}

function btnRefuse()
{
    //
    history.back();
}