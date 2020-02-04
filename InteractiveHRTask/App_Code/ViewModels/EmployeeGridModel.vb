Public Class EmployeeGridModel
	Private _Id As Integer

	Private _FullName As String

	Private _Email As String

	Private _Phone As String

	Private _DepartmentId As System.Nullable(Of Integer)

	Private _Salary As Integer

	Private _JobTitle As String

	Private _Status As Integer

	Private _ProfilePicture As String

	Private _DepartmentName As String

	Private _SalaryAfterDeduction As Double

	Public Property DepartmentName As String
		Get
			Return _DepartmentName
		End Get
		Set(value As String)
			_DepartmentName = value
		End Set
	End Property

	Public Property ProfilePicture As String
		Get
			Return _ProfilePicture
		End Get
		Set(value As String)
			_ProfilePicture = value
		End Set
	End Property

	Public Property Status As Integer
		Get
			Return _Status
		End Get
		Set(value As Integer)
			_Status = value
		End Set
	End Property

	Public Property JobTitle As String
		Get
			Return _JobTitle
		End Get
		Set(value As String)
			_JobTitle = value
		End Set
	End Property

	Public Property Salary As Integer
		Get
			Return _Salary
		End Get
		Set(value As Integer)
			_Salary = value
		End Set
	End Property

	Public Property DepartmentId As Integer?
		Get
			Return _DepartmentId
		End Get
		Set(value As Integer?)
			_DepartmentId = value
		End Set
	End Property

	Public Property Phone As String
		Get
			Return _Phone
		End Get
		Set(value As String)
			_Phone = value
		End Set
	End Property

	Public Property Email As String
		Get
			Return _Email
		End Get
		Set(value As String)
			_Email = value
		End Set
	End Property

	Public Property FullName As String
		Get
			Return _FullName
		End Get
		Set(value As String)
			_FullName = value
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

	Public Property SalaryAfterDeduction As Double
		Get
			Return _SalaryAfterDeduction
		End Get
		Set(value As Double)
			_SalaryAfterDeduction = value
		End Set
	End Property
End Class
