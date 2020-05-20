<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="ElibraryManagement.AdminBookIssuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5"> 
                <div class="card">
                    <div class="card-body">

                        

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>                                   
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" width="100"/>
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
                                <label>Member ID</label>
                               <div class="form-group">
                                    
                                        <asp:TextBox cssClass="form-control" ID="txtMemberID" runat="server" placeholder="Member ID"></asp:TextBox>
                               </div>

                            </div>

                            <div class="col-md-6">
                                <label>Book ID</label>
                               <div class="form-group">
                                   <div class="input-group">
                                   <asp:TextBox cssClass="form-control" ID="txtBookID" runat="server" placeholder="Book ID"></asp:TextBox>
                                   <asp:Button class="btn btn-secondary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                               </div>
                                   </div>
                            </div>
                        </div>

                    <div class="row">

                        <div class="col-md-6">
                                <label>Member Name</label>
                               <div class="form-group">
                                    
                                        <asp:TextBox cssClass="form-control" ID="txtMemberName" runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                               </div>

                            </div>

                        <div class="col-md-6">
                                <label>Book Name</label>
                               <div class="form-group">
                                    
                                        <asp:TextBox cssClass="form-control" ID="txtBookName" runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                               </div>

                            </div>

                    </div>

                        
                    <div class="row">

                        <div class="col-md-6">
                                <label>Start Date</label>
                               <div class="form-group">
                                    
                                        <asp:TextBox cssClass="form-control" ID="txtStartDate" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                               </div>

                            </div>

                        <div class="col-md-6">
                                <label>Due Date</label>
                               <div class="form-group">
                                    
                                        <asp:TextBox cssClass="form-control" ID="txtDueDate" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                               </div>

                            </div>
                        </div>

                        <!--Button-->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">  
                                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Issue" OnClick="Button1_Click" />
                               </div>

                            </div>

                            <div class="col-md-6">
                                <div class="form-group">  
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button2" runat="server" Text="Return" OnClick="Button2_Click" />
                               </div>
                            </div>
                        </div>
                         <!--Button-->
                        </div>
                    </div>
                    <a href="homepage.aspx" > < < Back to Home </a><br /><br />
                </div>
                <br /><br />

               <!-- End of Col 1 --> 
           
            <!--Second Col -->

            <div class="col-md-7">
                  <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Books List</h4>
                                                                        
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-stripped table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        
                       

                        
                        </div>

                      

                    </div>
 
            </div>
        </div>
    </div>

</asp:Content>
