Public Function NNPV(rate, ParamArray cashflows()) As Variant

	'NPV that accounts for initial outflow

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

	'PV of annuity
	PVA = (pmt / rate) * (1 - (1 / (1 + rate) ^ nper))

End Function

Public Function FVA(rate As Single, nper As Integer, pmt As Double) As Double

	'FV of annuity
	FVA = (pmt / rate) * ((1 / (1 + rate) ^ nper) - 1)

End Function

Public Function PVGA(rate As Single, growth As Single, nper As Integer, pmt As Double) As Double

	'PV of growing annuity
	PVGA = (pmt / (rate - growth)) * (1 - ((1 + growth) / (1 + rate)) ^ nper)

End Function

Public Function FVGA(rate As Single, growth As Single, nper As Integer, pmt As Double) As Double

	'FV of growing annuity
	FVGA = pmt * (((1 + rate) ^ nper) - ((1 + growth) ^ nper) / (rate - growth))

End Function
