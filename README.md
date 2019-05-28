### Intenciones en Flutter

Ejemplo de aplicaion usando intenciones con flutter y url_launcher

### Vista Principal

[![Vista Principal][]][Vista Principal]


```dart
onTap: () async {
          var url='';
          switch(id){
            case 1:
                url = 'https://itcelaya.edu.mx';break;
            case 2: 
                url = 'tel:4615468324';break;
            case 3:
                url = 'sms:4615468324';break;
            case 4:
                File img= await ImagePicker.pickImage(source: ImageSource.camera);
                break;
            case 5:
                url = 'mailto:smith@example.org?subject=News&body=New%20plugin';break;
            case 6:
                url = 'https://open.spotify.com/track/6WkJ2OK163XXS2oARUC9JM';break;
            case 7:
                url = 'instagram://user?username=eduardo_silva_a';break;
            case 8:
                url = 'https://goo.gl/maps/UTKeJdVfjVzhetQg9';break;
            case 9:
                url = 'whatsapp://send?text=Hello%2C%20World!';break;
            case 10:
                url = 'fb://albums';break;
          }
          if (id != 4){
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              print("No se pudo lanzar");
            }
          }
        },
```
[Vista Principal]: https://github.com/Lalopa/intenciones/blob/master/images/vista.gif
