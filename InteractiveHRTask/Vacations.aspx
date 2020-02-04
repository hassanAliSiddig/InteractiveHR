<%@ Page Title="Vacations Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Vacations.aspx.vb" Inherits="InteractiveHRTask.Vacations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="VacationsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="VacationsList" GridLines="Vertical" DataKeyNames="Id">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:TemplateField HeaderText="Employee" SortExpression="EmployeeName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EmployeesList" DataTextField="FullName" DataValueField="Id" SelectedValue='<%# Bind("EmployeeId") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="EmployeesList" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT [Id], [FullName] FROM [Employees] WHERE Status <> 9"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VacationType" SortExpression="VacationTypeName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="VacationTypes" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("VacationTypeId") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="VacationTypes" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT [Id], [Name], [IstPaidByDefault] FROM [VacationTypes]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("VacationTypeName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="StartDate" DataFormatString="{0:d}" HeaderText="StartDate" HtmlEncode="False" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" DataFormatString="{0:d}" HeaderText="EndDate" HtmlEncode="False" SortExpression="EndDate" />
            <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
            <asp:CheckBoxField DataField="IsPaid" HeaderText="IsPaid" SortExpression="IsPaid" />
            <asp:TemplateField HeaderText="Status" SortExpression="StatusName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="VacationStatusList" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("StatusId") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="VacationStatusList" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT * FROM [VacationStatus]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("StatusName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField HeaderText="Actions" ShowEditButton="True" ShowDeleteButton="True" ButtonType="Image" CancelImageUrl="~/Content/cancel icon.png" DeleteImageUrl="~/Content/delete icon.png" EditImageUrl="~/Content/pen icon.png" UpdateImageUrl="~/Content/save icon.png" />
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
    <asp:ObjectDataSource ID="VacationsList" runat="server" SelectMethod="GetVacations" TypeName="VacationsManager" DataObjectTypeName="VacationGridModel" UpdateMethod="UpdateVacation" DeleteMethod="DeleteVacation"  OnDeleted="VacationsList_Deleted">
    </asp:ObjectDataSource>
     <%--  --%>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Create New Vacation
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Vacation Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <form id="EmployeeCreationForm">
          <div class="form-group">
    <label for="exampleInputEmail1">Employee</label>
     <asp:DropDownList CssClass="form-control" ID="Employee" runat="server" DataSourceID="Employees" DataTextField="FullName" DataValueField="Id" AppendDataBoundItems="True">
         <asp:ListItem Value="" Text="Select Employee"></asp:ListItem>
     </asp:DropDownList>
        <asp:SqlDataSource ID="Employees" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT [FullName], [Id] FROM [Employees] WHERE Status <> 9"></asp:SqlDataSource>
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
     
 
    
  <div class="form-group">
    <label for="exampleInputEmail1">Vacation Type</label>
     <asp:DropDownList CssClass="form-control" ID="VacationType" runat="server" DataSourceID="AllVacationTypes" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
         <asp:ListItem Value="" Text="Select Type"></asp:ListItem>
     </asp:DropDownList>
      <asp:SqlDataSource ID="AllVacationTypes" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT * FROM [VacationTypes]"></asp:SqlDataSource>
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>

 <%-- <div class="form-group">
    <label for="exampleInputEmail1">Reason</label>
    <input type="text" placeholder="Enter the vacation reason" class="form-control" id="Reason" runat="server" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>--%>
 
  <div class="form-group">
    <label for="exampleInputEmail1">Reason</label>
      <textarea placeholder="Enter the vacation reason" class="form-control" id="VacationReason" runat="server"></textarea>
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
 
  <div class="form-group">
    <label for="exampleInputEmail1">Start Date</label>
    <input type="text" placeholder="Select Start Date" class="form-control" id="StartDatePicker" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
 
  <div class="form-group">
    <label for="exampleInputEmail1">End Date</label>
    <input type="text" placeholder="Select End Date" class="form-control" id="EndDatePicker" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
 
    
  <div class="form-group">
    <label for="exampleInputEmail1">Initial Status</label>
     <asp:DropDownList CssClass="form-control" ID="Status" runat="server" DataSourceID="AllVacationStatus" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
         <asp:ListItem Value="" Text="Select Initial Status"></asp:ListItem>
     </asp:DropDownList>
      <asp:SqlDataSource ID="AllVacationStatus" runat="server" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" SelectCommand="SELECT * FROM [VacationStatus] WHERE Name <> 'New'"></asp:SqlDataSource>
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
     
 

 

  <div class="form-group form-check" style="text-align:center">
    <label for="exampleInputEmail1" >Is the vacation paid</label>
    <input type="checkbox" class="form-control form-check-input" id="IsPaid" runat="server" aria-describedby="emailHelp">
    <%--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
  </div>
    <%--  --%>
  
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <asp:Button OnClick="SubmitButton_Click" ID="SubmitButton" CssClass="btn btn-primary" runat="server" Text="Save" />
      </div>
    </div>
  </div>
</div>
    <%--  --%>

</asp:Content>