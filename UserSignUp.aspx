<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="ElibraryManagement.UserSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="css/Signup.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br /><br />
     <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">   <!--mx-auto brings everything to the center -->

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/generaluser.png" width="100"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Sign Up</h4>
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
                            <div class="col-md-6">
                                <label>Full Name</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtFullName" runat="server" placeholder="Full Name"></asp:TextBox>
                               </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtDob" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                           <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtContactNo" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                               </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtEmail" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <!-- Sate City and Pincode-->

                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                               <div class="form-group">
                                   <!--for the State select -->
                                   <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Select" Value="select" />
                              <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                              <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                              <asp:ListItem Text="Assam" Value="Assam" />
                              <asp:ListItem Text="Bihar" Value="Bihar" />
                              <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Goa" Value="Goa" />
                              <asp:ListItem Text="Gujarat" Value="Gujarat" />
                              <asp:ListItem Text="Haryana" Value="Haryana" />
                              <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                              <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                              <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                              <asp:ListItem Text="Karnataka" Value="Karnataka" />
                              <asp:ListItem Text="Kerala" Value="Kerala" />
                              <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                              <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                              <asp:ListItem Text="Manipur" Value="Manipur" />
                              <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                              <asp:ListItem Text="Mizoram" Value="Mizoram" />
                              <asp:ListItem Text="Nagaland" Value="Nagaland" />
                              <asp:ListItem Text="Odisha" Value="Odisha" />
                              <asp:ListItem Text="Punjab" Value="Punjab" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Sikkim" Value="Sikkim" />
                              <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                              <asp:ListItem Text="Telangana" Value="Telangana" />
                              <asp:ListItem Text="Tripura" Value="Tripura" />
                              <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                              <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                              <asp:ListItem Text="West Bengal" Value="West Bengal" />
                           </asp:DropDownList>
                                <!--for the State select -->
                               </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtCity" runat="server" placeholder="City" TextMode="SingleLine"></asp:TextBox>
                               </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pincode</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtPincode" runat="server" placeholder="Pincode" TextMode="Number"></asp:TextBox>
                               </div>
                            </div>


                        </div>
                        <!-- Sate City and Pincode-->

                        <!--Address-->

                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtFaddress" runat="server" Placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                               </div>
                            </div>
                            </div>

                        <!--Address-->

                        <!--Adding a pill for login credentials-->
                        <div class="row">
                            <div class="col-md-12">
                                <center>
                                <span class="badge badge-pill badge-info">Login Credentials</span>
                                 </center>
                            </div>
                       </div>

                        <!--Adding a pill for login credentials-->
                        <!--Login Credentials-->
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtMemberID" runat="server" placeholder="UserID"></asp:TextBox>
                               </div>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtPswd" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                               </div>
                            </div>
                        </div>
                        <!--Login Credentials-->

                        <div class="row">
                            <div class="col">
           

                                <div class="form-group">
                                   
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />

                               </div>


                            </div>
                        </div>

                    </div>
                    <a href="homepage.aspx" > < < Back to Home </a><br />
                </div>
                <br /><br />

                
            </div>

        </div>

    </div>

</asp:Content>
