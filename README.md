# ExcelFinanceGlobalUDFs

ExcelFinanceGlobalUDFs is a collection of custom built finance Excel functions that can be used globally, i.e. in any Excel workbook.

## How to use

### OS X:
* Copy time_value.xlam into Excel Startup folder:
* For Microsoft 2011, it is HD:Applications:Microsoft Office 2011:Office:Startup:Excel

### Windows:
* Copy time_value.xlam into Excel Startup folder:
* Unfortunately the Startup folder varies quite a bit on  Windows
* Ex: C:\Program Files\Microsoft Office\Office14\XLSTART

## Included functions

__NNPV:__ NPV function that accounts for outflows at time zero
* requires inputs **_rate_** and **_cashflows_**, in that order

__PVA:__ present value of an annuity
* requires inputs **_rate_**, **_number of periods_** and **_payments_**, in that order

__FVA:__ future value of an annuity
* requires inputs **_rate_**, **_number of periods_** and **_payments_**, in that order

__PVGA:__ present value of a growing annuity
* requires inputs **_rate_**, **_growth rate_**, **_number of periods_** and **_payments_**, in that order

__FVGA:__ future value of a growing annuity
* requires inputs **_rate_**, **_growth rate_**, **_number of periods_** and **_growth rate_**, in that order

__PVGP:__ present value of growing perpetuity
* requires inputs **_rate_**, **_growth rate_**, **_growth rate_**, in that order

__YTM:__ yield to maturity
* requires inputs **_rate_**, **_number of periods_**, **_price_**, **_face_value_**, in that order

