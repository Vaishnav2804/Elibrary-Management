using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElibraryManagement
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtPublisherID.Text != "" || txtPublisherID.Text != "")
            {
                if (checkifPublisherExits())
                {
                    Response.Write("<script>alert('Author with this ID already exists!');</script>");
                }
                else
                {
                    addNewPublisher();
                }
            }
            else
            {
                Response.Write("<script>alert('You have missed to fill ID or Author Name!!');</script>");

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            if (txtPublisherID.Text != "")
            {
                if (checkifPublisherExits())
                {
                    updatePublisher();

                }
                else
                {
                    Response.Write("<script>alert('Author with this ID does not exist!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('You have missed to fill ID or Author Name!!');</script>");

            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            if (txtPublisherID.Text != "")
            {

                if (checkifPublisherExits())
                {
                    deletePublisher();

                }
                else
                {
                    Response.Write("<script>alert('Author with this ID does not exist!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('You have missed to fill ID or Author Name!!');</script>");

            }

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getPublisherByID();
        }



        void addNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl(publisher_id,publisher_name) values(@publisher_id,@publisher_name)", con);
                cmd.Parameters.AddWithValue("@publisher_id", txtPublisherID.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Added Successfully');</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void updatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name=@publisher_name WHERE publisher_id='" + txtPublisherID.Text.Trim() + "'", con); ;

                cmd.Parameters.AddWithValue("@publisher_name", txtPublisherName.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void deletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id='" + txtPublisherID.Text.Trim() + "'", con); ;


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Deleted Successfully');</script>");
                clearform();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }


        void getPublisherByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + txtPublisherID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtPublisherName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }



        bool checkifPublisherExits()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + txtPublisherID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearform()
        {
            txtPublisherID.Text = "";
            txtPublisherName.Text = "";
        }
    }
}