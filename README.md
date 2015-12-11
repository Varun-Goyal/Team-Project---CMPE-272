# CMPE_272_Team14

Infralift: Crowdsourcing ideas, fixing old infrastructure.
Infralift helps users to report infrastructure related issues around them and suggest ideas on how to uplift such structures,
thus, beautifying the community and making it safer.

The website can be found here:
http://logininfra.mybluemix.net/

Features: 1. Login, register user page.
          2. Forgot Password functionality with email and random password generation
          3. View posts by others
          4. Make your own posts, with pictures, descrption
          5. Comment and upvote posts made by others
          6. Admin Panel with analytics, map view (Admin access: http://logininfra.mybluemix.net/admin Username: admin Password: password)
          7. Admin is automatically able to send emails to the concerned authorities based on area
          8. Admin has the ability to approve posts made by the users before they can be seen publically
          9. The website is resistant to SQL injection. It also has session based access and encrypted session based cookies maknig 
            the website highly secure against a variety of attacks like MIM and session hacking.

The project was developed using MEAN stack, that includes MongoDB, Express, AngularJS and NodeJS.
IBM Bluemix was used to deploy the web application and Bluemix MongoDB service and Bluemix MySQL services were used as databases.


However, due to the experimental nature of the MongoDB service of bluemix, the appliction is subject to crash under circumstances that
we can't control. For that reason we also have provided the code for the website that we deployed on localhost.

