# NAME OF APP
health_monitoring_app

## Valid Emails and Passwords
email: exampleuser@gmail.com <br/>
pass: 123456 <br/>

email: exampleadmin@gmail.com <br/>
pass: 123456 <br/>

email: examplemonitor@gmail.com <br/>
pass: 123456 <br/>

## Notes
1. I suggest gumamit ng Navigator.popUntil() kasi sa login, ang mangyayari kasi i: <br/>
        **base:** Homepage(that shows Login screen) <br/>
        **push:** ModalToSignUp(that shows the SignUpAs screen) <br/>
        **push:** SignUp(that shows the SignUp screen) <br/>
        *then need makabalik sa homepage kaya dapat magpop until sa base screen which is yung homepage natin* <br/>

2. In 'models' folder, yung data_model.dart is sa lahat na yon (admin, user, entrance monitor) <br/>
    A. So null lang yung iba kung di applicable <br/>
    B. And maaari pang madagdagan yung attributes non depending sa functionalities natin <br/>

3. Lastly, di pa final yung design, but ganiyan yung idea ^^. <br/>