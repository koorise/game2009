self.setTimeout(ctlOnload,1);
var i=5;

function ctlOnload()
{
    var obj = document.getElementById("btnApply");
    if(obj!=null && obj!=undefined)
    {
        obj.disabled = true;
        document.getElementById("readTime").style.display = "";
        document.getElementById("readTime").innerText = "("+i+")";
        self.setTimeout(addTime,1000);
    }
}

function addTime()
{
    if(i==1)
    {
        document.getElementById("btnApply").disabled = false;
        document.getElementById("readTime").style.display = "none";
    }
    else
    {
        i--;
        document.getElementById("readTime").innerText = "("+i+")";
        self.setTimeout(addTime,1000);
    }
}

function doAccept()
{
    var obj = document.getElementById("pop");
    if(obj!=null && obj!=undefined)
        obj.style.display = "none";
    return false;
}
