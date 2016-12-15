from requests_oauthlib import OAuth2Session

grant_type="authorization_code"
code="tzimmEr84kgSvTFjfQb2Ag"
client_id="l84fpIx3lxDVNFX6fA634g"
client_secret="dpfzzUiaiKAVi-8qYc5Yag"
redirect_uri="https://localhost:9000/"


oauth = OAuth2Session(client_id=client_id,client_secret=client_secret, redirect_uri=redirect_uri,
                          grant_type=grant_type,code=code)


token = oauth.fetch_token('https://musicbrainz.org/oauth2/authorize')