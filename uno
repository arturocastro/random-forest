cat uno
{Error using <a href="matlab:helpUtils.errorDocCallback('cat')" style="font-weight:bold">cat</a>
Dimension must be a finite integer.
} 
title('Convergence of forest')
xlabel('Number of trained trees')
ylabel('Average error rate')
h = errorbar(1:100, wine_ave_redux, wine_err_redux)

h =

  186.0033

legend(h, 'Wine')
h = errorbar(1:100, heart_ave_redux, heart_err_redux)

h =

  237.0033

set(hc(1),'color','g')
set(hc(2),'color','g')
hc = get(h, 'Children')

hc =

  239.0033
  238.0033

set(hc(1),'color','g')
set(hc(2),'color','g')
legend(hc(1), 'Heart')
h_heart = errorbar(1:100, heart_ave_redux, heart_err_redux)

h_heart =

  232.0034

hc_heart = get(h_heart, 'Children')

hc_heart =

  240.0033
  233.0034

set(hc_heart(1),'color','g')
set(hc_heart(2),'color','g')
h_wine = errorbar(1:100, wine_ave_redux, wine_err_redux)

h_wine =

  241.0033

h_breast = errorbar(1:100, breast_ave_redux, breast_err_redux)

h_breast =

  244.0033

hc_breast = get(h_breast, 'Children')

hc_breast =

  246.0033
  245.0033

set(hc_breast(2),'color','g')
set(hc_breast(1),'color','g')
set(hc_breast(2),'color','r')
set(hc_breast(1),'color','r')
legend(hc_heart(1), 'Heart', hc_breast(1), 'Breast', hc_wine(1), 'Wine')
{Undefined function 'hc_wine' for input arguments of type 'double'.
} 
legend(hc_heart(1), 'Heart')
legend(hc_wine(1), 'Wine')
{Undefined function 'hc_wine' for input arguments of type 'double'.
} 
legend(hc_breast(1), 'Wine')
legend(hc_breast(1), 'Breast')
hc_wine = get(h_wine, 'Children')

hc_wine =

  243.0033
  242.0033

legend(hc_wine(1), 'Wine')
n = matlabpool('size')

n =

     6

time_par
Elapsed time is 13.871184 seconds.
Elapsed time is 13.743554 seconds.
Elapsed time is 13.988205 seconds.
Elapsed time is 14.001514 seconds.
Elapsed time is 13.789683 seconds.
Elapsed time is 13.772947 seconds.
Elapsed time is 13.759568 seconds.
Elapsed time is 13.808044 seconds.
Elapsed time is 13.747983 seconds.
Elapsed time is 13.534635 seconds.
Elapsed time is 3.168624 seconds.
Elapsed time is 3.068319 seconds.
Elapsed time is 3.018606 seconds.
Elapsed time is 3.044033 seconds.
Elapsed time is 3.067906 seconds.
Elapsed time is 3.057568 seconds.
Elapsed time is 3.069231 seconds.
Elapsed time is 3.062416 seconds.
Elapsed time is 3.024599 seconds.
Elapsed time is 3.114118 seconds.
