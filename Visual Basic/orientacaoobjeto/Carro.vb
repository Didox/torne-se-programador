Public Class Carro
    Dim _cor As String
    Dim _valor As Double
    Dim _acessorios As String
    Dim _marca As String
    Dim _ano As String


    Public Property cor() As String
        Get
            Return _cor
        End Get
        Set(ByVal Value As String)
            _cor = Value
        End Set
    End Property

    Public Property valor() As String
        Get
            Return _valor
        End Get
        Set(ByVal Value As String)
            _valor = Value
        End Set
    End Property

    Public Property acessorios() As String
        Get
            Return _acessorios
        End Get
        Set(ByVal Value As String)
            _acessorios = Value
        End Set
    End Property

    Public Property marca() As String
        Get
            Return _marca
        End Get
        Set(ByVal Value As String)
            _marca = Value
        End Set
    End Property

    Public Property ano() As String
        Get
            Return _ano
        End Get
        Set(ByVal Value As String)
            _ano = Value
        End Set
    End Property


    Public Function executar() As String
        ano = marca
    End Function


End Class
