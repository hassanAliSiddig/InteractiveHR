Public Class Departments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DepartmentsGridView_RowDataBound(ByVal sender As Object, e As GridViewRowEventArgs) Handles DepartmentsGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub


    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs) Handles SubmitButton.Click
        Using context As New InteractiveHRDataContext()

            Dim department As New Department With {.Name = DepartmentName.Value, .Status = 1}

            context.Departments.InsertOnSubmit(department)

            context.SubmitChanges()
        End Using
        Response.Redirect("/Departments")
    End Sub
End Class