
getChromeCookiesFile =
function()
{
   ff = list.files("~/Library/Application Support/Google/Chrome", pattern = "^Cookies$", recursive = TRUE, full.names = TRUE)
   if(length(ff) == 0)
       stop("cannot determine Firefox profile")
   if(length(ff) > 1)
      ff = ff[ which.max(file.info(ff)$mtime) ]
}


getLoginCookieChrome =
function(cookiesDB = getChromeCookiesFile())
{
   con = dbConnect(SQLite(), cookiesDB)
   ck = dbGetQuery(con, "SELECT * FROM cookies WHERE host_key = 'www.goodreads.com' OR host_key = '.goodreads.com'")
   paste(ck$name, ck$value, sep = "=", collapse = ";")   
}
