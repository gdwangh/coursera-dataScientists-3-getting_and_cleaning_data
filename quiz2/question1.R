install.packages("httr")
library(httr)
install.packages("httpuv")
library(httpuv)
install.packages("jsonlite")
library(jsonlite)

# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
# Insert your values below - if secret is omitted, it will look it up in
# the GITHUB_CONSUMER_SECRET environmental variable.
#
# Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", "758b735a5393cb26b67c", "1a897eade5d166d8e79966be73daf914b4dab788")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
rawJson<-content(req)
json2<-jsonlite::fromJSON(toJSON(rawJson))
json2[json2$git_url=="git://github.com/jtleek/datasharing.git", "created_at"]

