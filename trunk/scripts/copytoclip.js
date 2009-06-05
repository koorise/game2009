function copyToClip(aobj)
{
    if (window.clipboardData) 
    {
        if (aobj!=null && aobj!=undefined)
        {
            var txt = document.getElementById(aobj).innerText;
            window.clipboardData.clearData();
            window.clipboardData.setData("Text", txt);
        }
        else
        {
            aobj = event.srcElement;
            while (aobj != Object)
                aobj = aobj.previousSibling;
            
            var txt = aobj.innerText;
            window.clipboardData.clearData();
            window.clipboardData.setData("Text", txt);
        }
    }
    return false;
}