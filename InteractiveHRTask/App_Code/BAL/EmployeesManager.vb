Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports InteractiveHRTask

Public Class EmployeesManager
    Public Function GetEmployees() As List(Of EmployeeGridModel)


        Using context As New InteractiveHRDataContext()
            context.DeferredLoadingEnabled = False
            Dim employees As List(Of EmployeeGridModel) = (From e In context.Employees
                                                           Where e.Status <> EmployeeStataus.Deleted
                                                           Select New EmployeeGridModel With {
                                                               .Id = e.Id,
                                                               .FullName = e.FullName,
                                                               .Email = e.Email,
                                                               .DepartmentName = e.Department.Name,
                                                               .JobTitle = e.JobTitle,
                                                               .Phone = e.Phone,
                                                               .Salary = e.Salary,
                                                               .ProfilePicture = e.ProfilePicture,
                                                               .DepartmentId = e.DepartmentId,
                                                               .Status = e.Status,
                                                               .SalaryAfterDeduction = CalculateSalary(e.Id)}).ToList()
            Return employees
        End Using
    End Function

    Public Sub UpdateEmployee(ByVal emp As EmployeeGridModel)
        Using context As New InteractiveHRDataContext()

            Try
                Dim employee As Employee = (From e In context.Employees
                                            Where e.Id = emp.Id).FirstOrDefault()
                employee.FullName = emp.FullName
                employee.Email = emp.Email
                employee.Phone = emp.Phone
                employee.Salary = emp.Salary
                employee.JobTitle = emp.JobTitle
                employee.DepartmentId = emp.DepartmentId

                context.SubmitChanges()
            Catch ex As Exception
                Console.WriteLine(ex)
            End Try

        End Using
    End Sub

    Public Sub DeleteEmployee(ByVal emp As EmployeeGridModel)
        Using context As New InteractiveHRDataContext()
            Dim employee As Employee = (From em In context.Employees
                                        Where em.Id = emp.Id).FirstOrDefault()
            employee.Status = EmployeeStataus.Deleted
            context.SubmitChanges()
        End Using
    End Sub


    Public Sub CreateEmployee(ByVal emp As Employee)
        Using context As New InteractiveHRDataContext()

            context.Employees.InsertOnSubmit(emp)

            context.SubmitChanges()

        End Using
    End Sub

    Public Function CalculateSalary(ByVal id As Integer) As Double
        Using context As New InteractiveHRDataContext()

            context.DeferredLoadingEnabled = False

            Dim employee As Employee = (From e In context.Employees
                                        Where e.Id = id).FirstOrDefault()

            Dim employeeVacations = (From v In context.Vacations
                                     Where v.EmployeeId = employee.Id).ToList()

            Dim todaysDate As Date = Date.Now

            Dim currentMonthBeginningDate As Date = New Date(todaysDate.Year, todaysDate.Month, 1)

            Dim firstOfNextMonthDate As Date = New Date(todaysDate.Year, todaysDate.Month + 1, 1)


            Dim approvedVacationStatusId As Integer = 3

            Dim vacationsHaveDaysInCurrentMonth = (From v In employeeVacations
                                                   Where (v.StartDate >= currentMonthBeginningDate AndAlso
                                               v.StartDate < firstOfNextMonthDate OrElse
                                               v.EndDate >= currentMonthBeginningDate AndAlso
                                               v.EndDate < firstOfNextMonthDate) AndAlso
                                                       v.IsPaid = False AndAlso v.StatusId = approvedVacationStatusId).ToList()
            Dim vacationDaysWithinCurrentMonth As List(Of Date) = New List(Of Date)

            For Each v In vacationsHaveDaysInCurrentMonth
                Dim datePointer As Date = v.StartDate
                While datePointer < v.EndDate
                    If Not vacationDaysWithinCurrentMonth.Contains(datePointer) AndAlso
                        datePointer >= currentMonthBeginningDate AndAlso
                        datePointer < firstOfNextMonthDate Then
                        vacationDaysWithinCurrentMonth.Add(datePointer)
                    End If
                    datePointer = datePointer.AddDays(1)
                End While
            Next

            Dim salaryAfterDeduction = Math.Ceiling(employee.Salary - (employee.Salary / 31) * vacationDaysWithinCurrentMonth.Count())

            Return salaryAfterDeduction

        End Using
    End Function
End Class


Public Enum EmployeeStataus
    Active = 1
    Deleted = 9
End Enum