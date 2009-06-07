function changtab(n,m,obj1,obj2)
{
	for(i=1;i<=m;i++)
	{
		document.getElementById(obj2+i).style.display='none';
		document.getElementById(obj1+i).className='none';
	
	}
	
	document.getElementById(obj2+n).style.display='block';
	document.getElementById(obj1+n).className='cur';
}
