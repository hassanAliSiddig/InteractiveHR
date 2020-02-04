Public Class VacationGridModel
    Private _Id As Integer

    Private _EmployeeId As System.Nullable(Of Integer)

    Private _StartDate As Date

    Private _EndDate As Date

    Private _VacationTypeId As System.Nullable(Of Integer)

    Private _Reason As String

    Private _IsPaid As Boolean

    Private _StatusId As System.Nullable(Of Integer)

    Private _EmployeeName As String

    Private _StatusName As String

    Private _VacationTypeName As String

    Public Property EmployeeId As Integer?
        Get
            Return _EmployeeId
        End Get
        Set(value As Integer?)
            _EmployeeId = value
        End Set
    End Property

    Public Property Id As Integer
        Get
            Return _Id
        End Get
        Set(value As Integer)
            _Id = value
        End Set
    End Property

    Public Property StartDate As Date
        Get
            Return _StartDate
        End Get
        Set(value As Date)
            _StartDate = value
        End Set
    End Property

    Public Property EndDate As Date
        Get
            Return _EndDate
        End Get
        Set(value As Date)
            _EndDate = value
        End Set
    End Property

    Public Property VacationTypeId As Integer?
        Get
            Return _VacationTypeId
        End Get
        Set(value As Integer?)
            _VacationTypeId = value
        End Set
    End Property

    Public Property Reason As String
        Get
            Return _Reason
        End Get
        Set(value As String)
            _Reason = value
        End Set
    End Property

    Public Property IsPaid As Boolean
        Get
            Return _IsPaid
        End Get
        Set(value As Boolean)
            _IsPaid = value
        End Set
    End Property

    Public Property StatusId As Integer?
        Get
            Return _StatusId
        End Get
        Set(value As Integer?)
            _StatusId = value
        End Set
    End Property

    Public Property EmployeeName As String
        Get
            Return _EmployeeName
        End Get
        Set(value As String)
            _EmployeeName = value
        End Set
    End Property

    Public Property StatusName As String
        Get
            Return _StatusName
        End Get
        Set(value As String)
            _StatusName = value
        End Set
    End Property

    Public Property VacationTypeName As String
        Get
            Return _VacationTypeName
        End Get
        Set(value As String)
            _VacationTypeName = value
        End Set
    End Property
End Class
