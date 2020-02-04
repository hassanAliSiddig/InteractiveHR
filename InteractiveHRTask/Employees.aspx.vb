Public Class Employees
    Inherits System.Web.UI.Page

    Private _employeesManager As EmployeesManager
    Public Sub New()
        _employeesManager = New EmployeesManager()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Page.Response.Cache.SetCacheability(HttpCacheability.NoCache)

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        Dim employee As New Employee With {.FullName = FullName.Value, .Email = Email.Value, .DepartmentId = Department.SelectedValue,
            .JobTitle = JobTitle.Value, .Phone = Phone.Value, .Status = 1,
            .Salary = Salary.Value}
        _employeesManager.CreateEmployee(employee)
        Response.Redirect("/Employees")
    End Sub

    Protected Sub EmployeesList_Deleted(sender As Object, e As ObjectDataSourceStatusEventArgs)
        Response.Redirect("/Employees")
    End Sub

End Class