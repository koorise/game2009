using System;
using System.Data;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SubSonic;
/// <summary>
///Tools
/// </summary>
public class Tools
{
	public Tools()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 添加Dropdownlist
    /// </summary>
    /// <param name="ddl">dropdownlist控件</param>
    /// <param name="table">数据库表</param>
    /// <param name="condition">特殊选择项</param>
    /// <param name="indexOption">默认标题</param>
    /// <param name="whereStr">查询条件:1维 字段名;2维 字段值</param>
    public static void FillDropDownList(DropDownList ddl,string table,string condition,string indexOption,params string[] whereStr)
    {
        ddl.Items.Clear();
        Query q = new Query(table);
        if(whereStr.Length !=0)
        {
            q.AddWhere(whereStr[0], whereStr[1]);
        }
        IDataReader dr = q.ExecuteReader();
        ListItem _li=new ListItem(indexOption,"0");
        ddl.Items.Add(_li);
        while (dr.Read())
        {
            ListItem li = new ListItem(dr[1].ToString(), dr[0].ToString());
            if (dr[0].ToString() == condition)
            {
                li.Selected = true;
            }
            ddl.Items.Add(li);
        }
    }
    /// <summary>
    /// 检验登陆状态，返回Boolean
    /// </summary>
    /// <returns></returns>
    public static bool ChkStatus()
    {
        string uID = Cookies.getCookies("cUID");
        string userName = Cookies.getCookies("cUserName");
        string ip = HttpContext.Current.Request.UserHostName;
        return Cookies.ChkCook(uID + userName + ip + Cookies.CookiesKey, Cookies.getCookies("cMD5"));
    }
    /// <summary>
        /// FileUpload上传文件函数
    /// </summary>
    /// <param name="f">FileUpLoad控件名</param>
    /// <param name="path">相对路径,例如~/Upload/</param>
    /// <param name="tp">可选参数,合法文件后缀名,例如jpg</param>
    /// <returns>返回文件路径.返回0，则该文件不合法</returns>
    public static string UpLoadImagesURL(FileUpload f,string path, params string[] tp)
    {
        string filename = f.PostedFile.FileName;
        if (filename != "")
        {
            int i = filename.IndexOf('.');
            string ex = filename.Substring(i, filename.Length - i);
            string _filename = DateTime.Now.ToString("yyyyMMddHHmmssfff") + Cookies.getCookies("cUID") + ex;
            string _path = HttpContext.Current.Server.MapPath(path + _filename);
            if(!File.Exists(_path))
            {
                Directory.CreateDirectory(_path);
            }
            foreach (string s in tp)
            {
                if (ex == "." + s)
                {
                    f.PostedFile.SaveAs(_path);
                    return path + _filename;
                }
            }
        }
        return "0";
    }
}
