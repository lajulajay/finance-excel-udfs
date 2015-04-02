Public Function NNPV(rate, ParamArray cashflows()) As Variant
    
    Dim npv As Double
    Dim arg, ele
    Dim i As Long
    
    For Each arg In cashflows
        If TypeOf arg Is Range Or VarType(arg) > vbArray Then
            For Each ele In arg
                npv = npv + ele / (1 + rate) ^ i
                i = i + 1
            Next ele
        Else
            npv = npv + arg / (1 + rate) ^ i
            i = i + 1
        End If
    Next arg
    NNPV = npv

End Function

Public Function PVA(rate As Single, nper As Integer, pmt As Double) As Double

    PVA = (pmt / rate) * (1 - (1 / (1 + rate) ^ nper))
       
End Function

Public Function FVA(rate As Single, nper As Integer, pmt As Double) As Double

    FVA = (pmt / rate) * ((1 / (1 + rate) ^ nper) - 1)
       
End Function

Public Function PVGA(rate As Single, growth As Single, nper As Integer, pmt As Double) As Double

    PVGA = (pmt / (rate - growth)) * (1 - ((1 + growth) / (1 + rate)) ^ nper)

End Function

Public Function FVGA(rate As Single, growth As Single, nper As Integer, pmt As Double) As Double

    FVGA = pmt * (((1 + rate) ^ nper) - ((1 + growth) ^ nper) / (rate - growth))
    
End Function

Public Function PVB(rate As Single, nper As Integer, pmt As Double, principal As Double) As Double

    PVB = (pmt / rate) * (1 - (1 / (1 + rate) ^ nper)) + (principal / (1 + rate) ^ nper)
    
End Function

Public Function PVGP(rate As Single, growth As Single, pmt As Double) As Double

    PVGP = payment / (rate - growth)
    
End Function

Public Function YTM(rate As Single, nper As Integer, price As Double, face_value As Double)

    Dim coupon As Double, yield As Single, step As Double
    Dim delta As Double, count As Long, x As Double
    
    coupon = rate * face_value
    yield = coupon / price
    step = 0.001
    
    Select Case yield
        
            Case Is > coupon
                YTM = yield + step
                Do
                    count = count + 1
                    x = 1 + YTM
                    delta = price - (coupon * SumIt(nper, x) + (face_value / x ^ nper))
                    YTM = YTM + step
                Loop While count <= 10000 And delta > 0
            
            Case Is < coupon
                YTM = yield - step
                Do
                    count = count + 1
                    x = 1 + YTM
                    delta = price - (coupon * SumIt(nper, x) + (face_value / x ^ nper))
                    YTM = YTM - step
                Loop While count <= 10000 And delta < 0
        
    End Select
                           
End Function

Private Function SumIt(N As Integer, x As Double) As Double

    For k = 1 To N
        SumIt = SumIt + 1 / (x) ^ k
    Next k

End Function
