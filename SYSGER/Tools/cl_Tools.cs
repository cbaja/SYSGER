using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data;
using SYSGER.Model;
namespace SYSGER.Tools
{
    public class cl_Tools
    {
        DataLayer dal = new DataLayer();
        public void ChangeControlStatus(Control parent, bool status)
        {

            foreach (Control c in parent.Controls)
                foreach (Control ctrl in c.Controls)

                    if (ctrl is TextBox)

                        ((TextBox)ctrl).Enabled = status;

                    else if (ctrl is Button)

                        ((Button)ctrl).Enabled = status;

                    else if (ctrl is RadioButton)

                        ((RadioButton)ctrl).Enabled = status;

                    else if (ctrl is ImageButton)

                        ((ImageButton)ctrl).Enabled = status;

                    else if (ctrl is CheckBox)

                        ((CheckBox)ctrl).Enabled = status;

                    else if (ctrl is DropDownList)

                        ((DropDownList)ctrl).Enabled = status;

                    else if (ctrl is HyperLink)

                        ((HyperLink)ctrl).Enabled = status;
                    else if (ctrl is CheckBoxList)

                        ((CheckBoxList)ctrl).Enabled = status;
                    else if (ctrl is CheckBoxList)

                        ((CheckBoxList)ctrl).Enabled = status;
        }

        //public void ExportReport(string reportToAttachPath, Dictionary<string, string> reportToAttachParameters, string reportName,string ExpFolder)
        //{

        //    Warning[] warnings;
        //    string[] streamids;
        //    string mimeType;
        //    string encoding;
        //    string filenameExtension;
        //    ReportViewer repview = new ReportViewer();

        //    repview.ServerReport.ReportServerUrl = new Uri("http://ld:80/reportserver");
        //    repview.ServerReport.ReportPath = reportToAttachPath;


        //    if (reportToAttachParameters != null)
        //    {
        //        Dictionary<string, string> reportParameters = reportToAttachParameters;

        //        List<ReportParameter> @params = new List<ReportParameter>();
        //        // Dim params As New List(Of ReportParameter)

        //        foreach (KeyValuePair<string, string> item in reportParameters)
        //        {
        //            @params.Add(new ReportParameter(item.Key, item.Value));
        //        }
        //        repview.ServerReport.SetParameters(@params);
        //        repview.ShowParameterPrompts = false;

        //    }

        //    // bytes ;

        //    byte[] bytes = repview.ServerReport.Render("Excel", null, out mimeType, out encoding, out filenameExtension, out streamids, out warnings);

        //   // string filename = Path.Combine(Path.GetTempPath(), reportName + ".xls");
        //    string filename = Path.Combine(ExpFolder, reportName + ".xls");
        //    using (FileStream fs = new FileStream(filename, FileMode.Create))
        //    { 
                
        //        fs.Write(bytes, 0, bytes.Length); 
            
        //    }
        //    repview.ServerReport.Refresh();
        //}



        

    }
}