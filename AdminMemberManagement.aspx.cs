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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //Btn Go
        protected void LnkBtnGo_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }
        //BtnActive
        protected void lbkBtnActive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }
        //Btn Click Pending
        protected void lnkBtnPending_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        //Btn Click Deactivate
        protected void lnkBtnDeactive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactivated");
        }



        bool checkIfMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txtMemberId.Text.Trim() + "';", con);
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



        void getMemberByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txtMemberId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txtFullname.Text = dt.Rows[0][0].ToString();
                    txtDob.Text = dt.Rows[0][1].ToString();
                    txtContactNo.Text = dt.Rows[0][2].ToString();
                    txtEmail.Text = dt.Rows[0][3].ToString();
                    txtState.Text = dt.Rows[0][4].ToString();
                    txtCity.Text = dt.Rows[0][5].ToString();
                    txtPincode.Text = dt.Rows[0][6].ToString();
                    txtFullAddress.Text = dt.Rows[0][7].ToString();
                    txtAcntStatus.Text = dt.Rows[0][10].ToString();

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


        void updateMemberStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status='" + status + "' WHERE member_id='" + txtMemberId.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Member Status Updated');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }



        void deleteMemberByID()
        {
            if (checkIfMemberExists())
            {
                
                try
                {
                    
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from member_master_tbl WHERE member_id='" + txtMemberId.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }


        }
        void clearForm()
        {
            txtContactNo.Text = "";
            txtAcntStatus.Text = "";
            txtCity.Text = "";
            txtDob.Text = "";
            txtEmail.Text = "";
            txtFullAddress.Text = "";
            txtFullname.Text = "";
            txtMemberId.Text = "";
            txtPincode.Text = "";
            txtState.Text = "";
        }
    }
}