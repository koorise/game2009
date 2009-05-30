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
using System.Text;
using GameDB;
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
        if(indexOption!="")
        {
            ListItem _li=new ListItem(indexOption,"0");
            ddl.Items.Add(_li);
        }
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
        string isblock = Cookies.getCookies("cisblock");
        return Cookies.ChkCook(uID + userName + isblock + ip + Cookies.CookiesKey, Cookies.getCookies("cMD5"));
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
    /// <summary>
    /// 计算分页页数
    /// </summary>
    /// <param name="count">记录总数</param>
    /// <param name="pagesize">页面大小</param>
    /// <returns>页数</returns>
    public  static int GetPageCount(int count, int pagesize)
    {
        int n = count/pagesize;
        int y = count%pagesize;
        if (y != 0)
            y = 1;
        return n + y;
    }
    /// <summary>
    /// 生成随机编号
    /// </summary>
    /// <returns>返回编号</returns>
    public static  decimal CreateNum()
    {
        return decimal.Parse(DateTime.Now.ToString("yyyyMMddHHmmss") + Cookies.getCookies("cUID").PadLeft(6, '0'));
    }
    public static string jsClipBoard()
    {
        StringBuilder str = new StringBuilder();
        str.Append("<SCRIPT language=javascript>");
        str.Append("function copyToClipBoard(values)");
        str.Append("{");
        str.Append("var clipBoardContent=values; ");
        str.Append("window.clipboardData.setData('Text',clipBoardContent);");
        str.Append("alert('复制成功！');");
        str.Append("}");
        str.Append("</SCRIPT>");
        return str.ToString();
    }
    public static string Error(string err)
    {
        return "<script language=javascript>alert('" + err + "');</script>";
    }
    public static string jsRedirect(string url)
    {
        return "<script lanuage=javascript>this.location.href('"+ url +"');</script>";
    }
    /// <summary>
    /// 检查密码提示问题及答案
    /// </summary>
    /// <param name="uid">用户id</param>
    /// <param name="questiontype">问题typeid</param>
    /// <param name="answerkey">答案</param>
    /// <returns>是否通过检查</returns>
    public static bool CheckQuestion(string uid,string questiontype,string answerkey)
    {
        Query q = GUserInfo.Query().WHERE("UserID", uid);
        string utype = q.SetSelectList("QuestionType").ExecuteScalar().ToString();
        string ukey = q.SetSelectList("MyKey").ExecuteScalar().ToString();
        if (utype != questiontype)
            return false;
        if (ukey != answerkey)
            return false;
        return true;
    }
    /// <summary>
    /// 剩余时间计算工具
    /// </summary>
    /// <param name="date">结束时间</param>
    /// <returns></returns>
    public static string  TimeLeft(string date)
    {
        DateTime dt = DateTime.Parse(date);
        TimeSpan ts = dt - DateTime.Now;
        return ts.Days.ToString() + "天" + ts.Hours.ToString() + "小时" + ts.Minutes.ToString() + "分";
    }

    public static string PicShow(bool b,string imgurl)
    {
        return b ? imgurl : imgurl.Replace(".","1.");
    }

    public static DataSet PageDST(string spd, string sql, string page, string recsperpage, string id, string sort)
    {
        //店铺商品列表数据绑定Repeater2
        StoredProcedure sp = new StoredProcedure(spd);
        sp.Command.AddParameter("@SQL", sql);
        sp.Command.AddParameter("@Page", page);
        sp.Command.AddParameter("@RecsPerPage", recsperpage);
        sp.Command.AddParameter("@ID", id);
        sp.Command.AddParameter("@Sort", sort);
        return sp.GetDataSet();
    }
}
