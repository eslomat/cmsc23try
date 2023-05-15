# health_monitoring_app

## Valid Emails and Password

email: exampleuser@gmail.com
pass: 123456

exampleadmin@gmail.com
pass: 123456

examplemonitor@gmail.com
pass: 123456

## Notes
1. I suggest gumamit ng Navigator.popUntil() kasi sa login, ang mangyayari kasi i:
        **base:** Homepage(that shows Login screen)
        **push:** ModalToSignUp(that shows the SignUpAs screen)
        **push:** SignUp(that shows the SignUp screen)
        *then need makabalik sa homepage kaya dapat magpop until sa base screen which is yung homepage natin*

2. In 'models' folder, yung data_model.dart is sa lahat na yon (admin, user, entrance monitor)
    A. So null lang yung iba kung di applicable
    B. And maaari pang madagdagan yung attributes non depending sa functionalities natin

3. Lastly, di pa final yung design, but ganiyan yung idea.