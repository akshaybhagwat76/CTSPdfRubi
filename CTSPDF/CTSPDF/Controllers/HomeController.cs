using CTSPDF.Models;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace CTSPDF.Controllers
{
    public class HomeController : Controller
    {

        private new_DbEntities dbEmployee = new new_DbEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult createPDF()
        {
            ViewBag.ctslist = dbEmployee.cse_summary_sixmonths_test.SqlQuery("select * from cse_summary_sixmonths_test").ToList();
            //ViewBag.ctslist = dbEmployee.cse_summary_sixmonths_test.ToList();
            
            return View();
        }
        public FileResult Export(string GridHtml)
        {
            using (MemoryStream stream = new System.IO.MemoryStream())
            {
                StringReader sr = new StringReader(GridHtml);
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);
                pdfDoc.Open();
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                pdfDoc.Close();
                return File(stream.ToArray(), "application/pdf", "Department.pdf");
            }
        }
        public ActionResult GetData(int? responseId)
        {
            if (responseId != null && responseId > 0)
            {
                var ctslist = dbEmployee.cse_summary_sixmonths_test.SqlQuery("select * from cse_summary_sixmonths_test where response_id=" + responseId + "").FirstOrDefault();

                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("~/Images/pdfhtml.html")))
                {
                    body = reader.ReadToEnd();
                }

                string strTemp = "";
                foreach(var item in ctslist.rock_star_winners.Split(','))
                {
                    if(item!=null && item!="")
                    {
                        strTemp += "<p>"+item+"</p>";
                    }
                }

                body = body.Replace("[Rockstar Individual]", strTemp);
                body = body.Replace("[Date first]", Convert.ToDateTime(ctslist.date_first.ToString()).ToString("MMM yyyy"));
                body = body.Replace("[Date Last]", Convert.ToDateTime(ctslist.date_last.ToString()).ToString("MMM yyyy"));
                body = body.Replace("[Super Star Winner]", ctslist.super_stars_winner.ToString());
                body = body.Replace("[Super Star Winner Avg]", ctslist.super_stars_winner_ave.ToString());
                body = body.Replace("[Super Star Runnerup]", ctslist.super_stars_runnerup.ToString());
                body = body.Replace("[Super Star Runner Avg]", ctslist.super_stars_runnerup_ave.ToString());
                body = body.Replace("[Blazing Star Winner]", ctslist.blazing_stars_winner.ToString());
                body = body.Replace("[Blazing Star Winner Avg]", ctslist.blazing_stars_winner_ave.ToString());

                body = body.Replace("[Blazing Star Runnerup]", ctslist.blazing_stars_runnerup.ToString());
                body = body.Replace("[Blazing Star Runner Avg]", ctslist.blazing_stars_runnerup_ave.ToString());

                body = body.Replace("[Supporting Star Winner]", ctslist.supporting_stars_winner.ToString());
                body = body.Replace("[Supporting Star Winner Avg]", ctslist.supporting_stars_winner_stars.ToString());

                body = body.Replace("[Supporting Star Runnerup]", ctslist.supporting_stars_runnerup.ToString());
                body = body.Replace("[Supporting Star Runner Avg]", ctslist.supporting_stars_runnerup_stars.ToString());

                string rightimageURL = Server.MapPath("~/Images/right.png");
                body = body.Replace("[right]", rightimageURL);

                string leftimageURL = Server.MapPath("~/Images/left.png");
                body = body.Replace("[left]", leftimageURL);

                //string logoimageURL = Server.MapPath("~/Images/left.png");
                //body = body.Replace("[logo]", logoimageURL);


                //return View();
                return Export(body);
            }
            else
            {
                return null;
            }
        }

    }
}