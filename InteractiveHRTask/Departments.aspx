<%@ Page Title="Departments Page" MasterPageFile="~/Site.Master" Language="vb" AutoEventWireup="false" CodeBehind="Departments.aspx.vb" Inherits="InteractiveHRTask.Departments" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="DepartmentsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="DepartmentsList" GridLines="Vertical">
        <AlternatingRowStyle BackColor="Gainsboro" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/Content/cancel icon.png" DeleteImageUrl="~/Content/delete icon.png" EditImageUrl="~/Content/pen icon.png" UpdateImageUrl="~/Content/save icon.png" />
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
    <asp:SqlDataSource ID="DepartmentsList" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:InteractiveHRTaskConnectionString %>" DeleteCommand="DELETE FROM [Departments] WHERE [Id] = @original_Id AND [Name] = @original_Name" InsertCommand="INSERT INTO [Departments] ([Name]) VALUES (@Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [Name] FROM [Departments]" UpdateCommand="UPDATE [Departments] SET [Name] = @Name WHERE [Id] = @original_Id AND [Name] = @original_Name">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

     <%--  --%>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Create New Department
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Department Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<form id="DepartmentCreationForm"> 
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input style="width: 100%" type="text" class="form-control" id="DepartmentName" aria-describedby="emailHelp" runat="server">
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
</asp:Content>
