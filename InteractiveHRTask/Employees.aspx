<%@ Page Title="Employees Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Employees.aspx.vb" Inherits="InteractiveHRTask.Employees" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EmployeesList" DataKeyNames="Id" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
    <Columns>
        <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
        <asp:TemplateField HeaderText="Department" SortExpression="DepartmentName">
            <EditItemTemplate>
                <asp:DropDownList AppendDataBoundItems="true"  ID="DropDownList1" runat="server" DataSourceID="Departments" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("DepartmentId") %>'>
                 <asp:ListItem Text="None" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Departments" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Departments]"></asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
        <asp:BoundField DataField="SalaryAfterDeduction" HeaderText="Salary After Deduction" ReadOnly="True" SortExpression="SalaryAfterDeduction" />
        <asp:CommandField ShowEditButton="True" HeaderText="Actions" ShowHeader="True" ShowDeleteButton="True" ButtonType="Image" CancelImageUrl="~/Content/cancel icon.png" DeleteImageUrl="~/Content/delete icon.png" EditImageUrl="~/Content/pen icon.png" SelectImageUrl="~/Content/dolar icon.png" UpdateImageUrl="~/Content/save icon.png" />
    </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>
<asp:ObjectDataSource ID="EmployeesList" runat="server" DataObjectTypeName="EmployeeGridModel" SelectMethod="GetEmployees" TypeName="EmployeesManager" UpdateMethod="UpdateEmployee" DeleteMethod="DeleteEmployee" OnDeleted="EmployeesList_Deleted">
  
</asp:ObjectDataSource>
    <%--  --%>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Create New Employee
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Employee Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <form id="EmployeeCreationForm">
      
           <div class="form-group">
    <label for="exampleInputEmail1">Full Name</label>
    <input style="width: 100%" type="text" class="form-control" id="FullName" aria-describedby="emailHelp" runat="server">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
     
 

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="Email" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Phone</label>
    <input type="number" class="form-control" id="Phone" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Job Title</label>
    <input type="text" class="form-control" id="JobTitle" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Salary</label>
    <input type="number" class="form-control" id="Salary" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
 <div class="form-group">
    <label for="exampleInputEmail1">Department</label>
     <asp:DropDownList CssClass="form-control" ID="Department" runat="server" DataSourceID="DepartmentsList" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
         <asp:ListItem Value="" Text="Select Department"></asp:ListItem>
     </asp:DropDownList>
     <asp:SqlDataSource ID="DepartmentsList" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Departments]"></asp:SqlDataSource>
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <asp:Button ID="SubmitButton" CssClass="btn btn-primary" runat="server" Text="Save" />
      </div>
    </div>
  </div>
</div>
    <%--  --%>
   <small id="emailHelp" class="form-text text-muted">Salary after decucting is the acctual salary minus a constant value for each day of the approved unpaid vacations</small>

</asp:Content>