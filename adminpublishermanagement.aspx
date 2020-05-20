<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="ElibraryManagement.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {

            //$(document).ready(function () {
            //$('.table').DataTable();
            // });

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            //$('.table1').DataTable();
        });
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5"> 
                <div class="card">
                    <div class="card-body">

                        

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher Details</h4>                                   
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/publisher.png" width="100"/>
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
                            <div class="col-md-4">
                                <label>Publisher ID</label>
                               <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox cssClass="form-control" ID="txtPublisherID" runat="server" placeholder="ID"></asp:TextBox>
                                         <asp:Button class="btn btn-secondary" ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" />
                                    </div>
                               </div>

                            </div>
                            <div class="col-md-8">
                                <label>Publisher Name</label>
                               <div class="form-group">
                                   
                                   <asp:TextBox cssClass="form-control" ID="txtPublisherName" runat="server" placeholder="Publisher Name"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">  
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btnAdd" runat="server" Text="ADD" OnClick="btnAdd_Click" />
                               </div>

                            </div>

                            <div class="col-md-4">
                                <div class="form-group">  
                                    <asp:Button class="btn btn-warning btn-block btn-lg" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                               </div>

                            </div>

                            <div class="col-md-4">
                                <div class="form-group">  
                                    <asp:Button class="btn btn-danger btn-block btn-lg" ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                               </div>

                            </div>
                        </div>
                     
                     

 
                        </div>

                    </div>
                    <a href="homepage.aspx" > < < Back to Home </a><br /><br />
                </div>
                <br /><br />

                
           

            <div class="col-md-7">
                  <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher List</h4>
                                                                        
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionStringpubisher %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-stripped table-bordered table-hover" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"></asp:GridView>
                            </div>
                        </div>

                        
                       

                        
                        </div>

                    </div>
 
            </div>
        </div>
    </div>

</asp:Content>
