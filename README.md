## My Resume App

This is the resume site I am personally using written in rails.
* It will generate a pdf version of the resume from the html when clicking the pdf link in the navbar.
* It will email the ip information of the viewer of the pdf version to the admin of the site using information from http://www.iptrackeronline.com
* It has an admin section for creating/updating the different sections along with the personal info
* It allows for markdown in the descriptions of each section for nice styling features.

### Environment Variables

| Variable              | Reason                                       |
| ----------------------| -------------------------------------------- |
| **MANDRILL_APIKEY**   | used for sending emails                      |
| **MANDRILL_USERNAME** | used for sending emails                      |
| **SECRET_KEY_BASE**   | used by devise                               |
| **DEFAULT_MAIL_HOST** | used for default from host in noreply emails |