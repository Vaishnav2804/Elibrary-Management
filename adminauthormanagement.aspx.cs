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
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //Add button Click
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtAuthorID.Text != "" || txtAuthorName.Text != "")
            {
                if (checkifAuthorExits())
                {
                    Response.Write("<script>alert('Author with this ID already exists!');</script>");
                }
                else
                {
                    addNewAuthor();
                }
            }
            else
            {
                Response.Write("<script>alert('You have missed to fill ID or Author Name!!');</script>");

            }
        }

        //Update button click
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtAuthorID.Text != "")
            {
                if (checkifAuthorExits())
                {
                    updateAuthor();

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

        //Delete button click
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtAuthorID.Text != "")
            {

                if (checkifAuthorExits())
                {
                    deleteAuthor();

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


        //Button Click Go
        protected void btnGo_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }


        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + txtAuthorID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtAuthorName.Text = dt.Rows[0][1].ToString();
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


        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id,author_name) values(@author_id,@author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", txtAuthorID.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());
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


        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name=@author_name WHERE author_id='" + txtAuthorID.Text.Trim() + "'", con); ;

                cmd.Parameters.AddWithValue("@author_name", txtAuthorName.Text.Trim());
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

        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id='" + txtAuthorID.Text.Trim() + "'", con); ;


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

        bool checkifAuthorExits()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + txtAuthorID.Text.Trim() + "';", con);
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
            txtAuthorName.Text = "";
            txtAuthorID.Text = "";
        }
    }
}