<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ElibraryManagement.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">   <!--mx-auto brings everything to the center -->

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/adminuser.png" width="150"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Admin Id</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtAdminID" runat="server" placeholder="Admin ID"></asp:TextBox>
                               </div>

                                <label>Password</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtPswd" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                               </div>

                                <div class="form-group">
                                   
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="LOGIN" OnClick="Button1_Click" />

                               </div>
                            </div>
                        </div>

                    </div>
                </div>

                <a href="homepage.aspx" > < < Back to Home </a><br /><br />
            </div>

        </div>

    </div>

</asp:Content>
