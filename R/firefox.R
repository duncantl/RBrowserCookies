getLoginHandle =
function(host, cookie = getLoginCookie(host), ..., curl = getCurlHandle())
{
   curlSetOpt(..., cookie = cookie, curl = curl)
   curl
}

getLoginCookie = getLoginCookieFirefox =
function(host, cookiesDB = getFirefoxCookiesFile(), con = dbConnect(SQLite(), cookiesDB))
{
    if(missing(con))
        on.exit(dbDisconnect(con))
    
   ck = dbGetQuery(con, sprintf("SELECT * FROM moz_cookies WHERE baseDomain = '%s'", host))
   paste(ck$name, ck$value, sep = "=", collapse = ";")   
}


getFirefoxCookiesFile =
function()
{
   dir = "~/Library/Application Support/Firefox/profiles"
   ver = R.Version()
   if(grepl("cygwin", ver$os)) 
       dir = sprintf("C:/Users/%s/AppData/Roaming/Mozilla/Firefox/Profiles", Sys.getenv("USERNAME"))
    
   ff = list.files(dir, pattern = "^cookies.sqlite$", recursive = TRUE, full.names = TRUE)
   if(length(ff) == 0)
       stop("cannot determine Firefox profile")
   if(length(ff) > 1)
      ff = ff[ which.max(file.info(ff)$mtime) ]
   else
      ff
}

