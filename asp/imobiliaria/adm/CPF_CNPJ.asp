<%Function CalculaCPF(Numero_CPF)
  Dim RecebeCPF, Numero(11), Soma, Resultado1, Resultado2
  Dim Vb_Valido, Vs_String, X, CH
  Vb_Valido = True
  RecebeCPF = Numero_CPF
  'Retirar todos os caracteres que nao sejam 0-9
  Vs_String = "" 
  For X = 1 to Len(RecebeCPF)
    Ch=Mid(RecebeCPF,X,1)
    If Asc(Ch)>=48 And Asc(Ch)<=57 Then
       Vs_String = Vs_String & Ch
    End If
  Next
  RecebeCPF = Vs_String
  If Len(RecebeCPF) <> 11 Then
     Vb_Valido = False
  Else
     IF RecebeCPF = "00000000000" Then
        Vb_Valido = False
     Else
        Numero(1) = Cint(Mid(RecebeCPF,1,1))
        Numero(2) = Cint(Mid(RecebeCPF,2,1))
        Numero(3) = Cint(Mid(RecebeCPF,3,1))
        Numero(4) = Cint(Mid(RecebeCPF,4,1))
        Numero(5) = Cint(Mid(RecebeCPF,5,1))
        Numero(6) = CInt(Mid(RecebeCPF,6,1))
        Numero(7) = Cint(Mid(RecebeCPF,7,1))
        Numero(8) = Cint(Mid(RecebeCPF,8,1))
        Numero(9) = Cint(Mid(RecebeCPF,9,1))
        Numero(10) = Cint(Mid(RecebeCPF,10,1))
        Numero(11) = Cint(Mid(RecebeCPF,11,1))
        Soma = 10 * Numero(1) + 9 * Numero(2) + 8 * Numero(3) + 7 * Numero(4) + 6 * Numero(5) + 5 * Numero(6) + 4 * Numero(7) + 3 * Numero(8) + 2 * Numero(9)
        Soma = Soma - (11 * (Int(Soma / 11)))
        IF Soma = 0 or Soma = 1 Then
           Resultado1 = 0
        Else
           Resultado1 = 11 - soma
        End IF
        IF Resultado1 = Numero(10) Then
           Soma = Numero(1) * 11 + Numero(2) * 10 + Numero(3) * 9 + Numero(4) * 8 + Numero(5) * 7 + Numero(6) * 6 + Numero(7) * 5 + Numero(8) * 4 + Numero(9) * 3 + Numero(10) * 2
           Soma = Soma -(11 * (Int(Soma / 11)))
           IF Soma = 0 or Soma = 1 Then
              Resultado2 = 0
           Else
              Resultado2 = 11 - Soma
           End IF
           IF Resultado2 = Numero(11) Then
              Vb_Valido = True
           Else
              Vb_Valido = False
           End IF
        Else 
           Vb_Valido = False
        End IF
     End IF
  END IF
  CalculaCPF = Vb_Valido
End Function

'|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

Function CalculaCNPJ(Numero_CNPJ)
  Dim RecebeCNPJ, Numero(14), Soma, Resultado1, Resultado2
  Dim Vb_Valido, Vs_String, X, CH
  Vb_Valido = True
  RecebeCNPJ = Numero_CNPJ
  'Retirar todos os caracteres que nao sejam 0-9
  Vs_String = "" 
  For X = 1 to Len(RecebeCNPJ)
    Ch=Mid(RecebeCNPJ,X,1)
    If Asc(Ch)>=48 And Asc(Ch)<=57 Then
       Vs_String = Vs_String & Ch
    End If
  Next
  RecebeCNPJ = Vs_String
  IF Len(RecebeCNPJ) <> 14 Then
     Vb_Valido = False
  Else
     IF RecebeCNPJ = "00000000000000" Then
        Vb_Valido = False
     Else
        Numero(1) = Cint(Mid(RecebeCNPJ,1,1))
        Numero(2) = Cint(Mid(RecebeCNPJ,2,1))
        Numero(3) = Cint(Mid(RecebeCNPJ,3,1))
        Numero(4) = Cint(Mid(RecebeCNPJ,4,1))
        Numero(5) = Cint(Mid(RecebeCNPJ,5,1))
        Numero(6) = CInt(Mid(RecebeCNPJ,6,1))
        Numero(7) = Cint(Mid(RecebeCNPJ,7,1))
        Numero(8) = Cint(Mid(RecebeCNPJ,8,1))
        Numero(9) = Cint(Mid(RecebeCNPJ,9,1))
        Numero(10) = Cint(Mid(RecebeCNPJ,10,1))
        Numero(11) = Cint(Mid(RecebeCNPJ,11,1))
        Numero(12) = Cint(Mid(RecebeCNPJ,12,1))
        Numero(13) = Cint(Mid(RecebeCNPJ,13,1))
        Numero(14) = Cint(Mid(RecebeCNPJ,14,1))
        Soma = Numero(1) * 5 + Numero(2) * 4 + Numero(3) * 3 + Numero(4) * 2 + Numero(5) * 9 + Numero(6) * 8 + Numero(7) * 7 + Numero(8) * 6 + Numero(9) * 5 + Numero(10) * 4 + Numero(11) * 3 + Numero(12) * 2
        Soma = Soma -(11 * (Int(Soma / 11)))
        IF Soma = 0 or Soma = 1 Then
           Resultado1 = 0
        Else
           Resultado1 = 11 - Soma
        End IF
        IF Resultado1 = Numero(13) Then
           Soma = Numero(1) * 6 + Numero(2) * 5 + Numero(3) * 4 + Numero(4) * 3 + Numero(5) * 2 + Numero(6) * 9 + Numero(7) * 8 + Numero(8) * 7 + Numero(9) * 6 + Numero(10) * 5 + Numero(11) * 4 + Numero(12) * 3 + Numero(13) * 2
           Soma = Soma - (11 * (Int(Soma/11))) 
           IF Soma = 0 or Soma = 1 Then
              Resultado2 = 0
           Else
              Resultado2 = 11 - Soma
           End IF
           IF Resultado2 = Numero(14) Then
              Vb_Valido = True
           Else
              Vb_Valido = False
           End IF
        Else
           Vb_Valido = False
        End IF
     End IF
  END IF
CalculaCNPJ    = Vb_Valido
End Function

Function IsValidEmail(Variavel)
  Dim bIsValid
  bIsValid = True
  If Variavel <> "" then 
     If Instr(Variavel,"@") <> 0 then 
        variavel_L = len(variavel) 
        Variavel_t = instr(variavel,"@") + 1 
        variavel_P = Mid(variavel,Variavel_t) 
        variavel_P2 = Instr(Variavel,".") 
        If Instr(variavel_P,".") = 0 then 
           bIsValid = False
        ElseIf Instr(variavel,".") = Variavel_t then 
           bIsValid = False
        ElseIf variavel_P2 = Len(variavel) then 
           bIsValid = False
        Else 
           bIsValid = true
        End If 
     ElseIf Instr(Variavel,"@") = 0 then 
        bIsValid = False
     End If 
  End If
  IsValidEmail = bIsValid
end function

Function data_valida(Variavel,tipo)
      if len(Variavel)<>10 then
         data_valida=false
      else
         if not isnumeric(mid(variavel,1,2)) or not isnumeric(mid(variavel,4,2)) or not isnumeric(mid(variavel,7,4)) or not isnumeric(mid(variavel,7,4)) then
            data_valida=false
         else
            if mid(variavel,1,2)>31 or mid(variavel,4,2)>12 or mid(variavel,7,4)<1900 or mid(variavel,7,4)>2079 then
               data_valida=false
            else
               if not isdate(variavel) then   
                  data_valida=false
               else
                  if datevalue(variavel)>datevalue(date()) and tipo=1 then
                     data_valida=false
                  else
                     data_valida=true
                  end if
               end if
            end if
         end if
      end if
end function

function data_completa(strData)
  data = cdate(strData) 
  dia =day(data) 
  mes = month(data) 
  ano = year(data) 
  if len(dia)=1 then 
     dia = "0" & dia 
  end if
  if len(mes)=1 then
     mes = "0" & mes
  end if
  data_completa = dia & "/" & mes & "/" & ano 
end function%>