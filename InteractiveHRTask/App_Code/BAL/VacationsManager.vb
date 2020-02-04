Imports System.Collections.Generic
Imports System.Linq
Imports InteractiveHRTask

Public Class VacationsManager
    Function GetVacations() As List(Of VacationGridModel)
        Using context As New InteractiveHRDataContext()

            context.DeferredLoadingEnabled = False

            Dim vacations As List(Of VacationGridModel) = (From v In context.Vacations
                                                           Select New VacationGridModel With {
                                                                 .Id = v.Id,
                                                                 .EmployeeId = v.EmployeeId,
                                                                 .EmployeeName = v.Employee.FullName,
                                                                 .StartDate = v.StartDate,
                                                                 .EndDate = v.EndDate,
                                                                 .IsPaid = v.IsPaid,
                                                                 .Reason = v.Reason,
                                                                 .StatusId = v.StatusId,
                                                                 .StatusName = v.VacationStatus.Name,
                                                                 .VacationTypeId = v.VacationTypeId,
                                                                 .VacationTypeName = v.VacationType.Name
                                                               }).ToList()
            Return vacations

        End Using

    End Function

    Public Sub UpdateVacation(ByVal vac As VacationGridModel)
        Using context As New InteractiveHRDataContext()

            Dim vacation As Vacation = (From v In context.Vacations
                                        Where v.Id = vac.Id).FirstOrDefault()

            vacation.IsPaid = vac.IsPaid

            vacation.Reason = vac.Reason

            vacation.StartDate = vac.StartDate

            vacation.EmployeeId = vac.EmployeeId

            vacation.StatusId = vac.StatusId

            vacation.VacationTypeId = vac.VacationTypeId

            vacation.EndDate = vac.EndDate

            context.SubmitChanges()

        End Using

    End Sub


    Public Sub DeleteVacation(ByVal vac As VacationGridModel)

        Using context As New InteractiveHRDataContext()
            Dim vacation As Vacation = (From v In context.Vacations
                                        Where v.Id = vac.Id).FirstOrDefault()

            context.Vacations.DeleteOnSubmit(vacation)

            context.SubmitChanges()
        End Using

    End Sub

    Public Sub CreateVacation(ByVal vacation As Vacation)

        Using context As New InteractiveHRDataContext()

            context.Vacations.InsertOnSubmit(vacation)

            context.SubmitChanges()

        End Using
    End Sub

End Class
