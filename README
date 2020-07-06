
This package allows you to retrieve cookies from a Web browser's store on your local machine.
You can get this for a particular site (host) and then add this to a curl handle in the RCurl
package. Then you can use this in requests to this site that need you to be logged in.
You first login to the Web site using your browser.
Then you switch to R and load the package and call 
```r
 h = getLoginHandle("website")
```

Then you use this curl handle in subsequent requests to that Web site.

For example, for goodreads.com, we login to the Web site via the Web browser.
Then we use this handle in a request, e.g.,

```r
h = getLoginHandle("goodreads.com")
u = "https://www.goodreads.com/review/list/6773727?sort=rating&view=reviews"
tt = getURLContent(u, curl = h, followlocation = TRUE)
```
Once we have this document, we can extract the information we want
```r
library(XML)
tbl = readHTMLTable(htmlParse(tt))
```
However, without the cookie, the document is entirely different and does not provide the information
we want.

