Public Class Vacations
    Inherits System.Web.UI.Page
    Private _vacationsManager As VacationsManager

    Public Sub New()
        _vacationsManager = New VacationsManager()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub VacationsGridView_RowDataBound(ByVal sender As Object, e As GridViewRowEventArgs) Handles VacationsGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Protected Sub SubmitButton_Click(sender As Object, e As EventArgs)

        Dim newVacationStatusId As Integer = 1

        Dim initialStatus As Integer = newVacationStatusId

        If Status.SelectedValue Is Nothing Then
            initialStatus = Status.SelectedValue
        End If

        Dim vacation As New Vacation With {
                .EmployeeId = Employee.SelectedValue,
                .StartDate = Date.Parse(StartDatePicker.Value),
                .EndDate = Date.Parse(EndDatePicker.Value),
                .StatusId = initialStatus,
                .IsPaid = IsPaid.Checked,
                .VacationTypeId = VacationType.SelectedValue,
                .Reason = VacationReason.Value
                }

            _vacationsManager.CreateVacation(vacation)

            Response.Redirect("/Vacations")
    End Sub

    Protected Sub VacationsList_Deleted(sender As Object, e As ObjectDataSourceStatusEventArgs)
        Response.Redirect("/Vacations")
    End Sub
End Class