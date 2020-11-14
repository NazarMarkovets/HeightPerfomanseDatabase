INSERT INTO `mu`.`fonts` 
(`idFonts`, `name_font`,
 `size`, `spacing`,
 `color_for_headers`,
 `color_for_text`,
 `padding`, `style`,
 `saturation`, `width`, `custom_macket`,
 `fontsTEXT`, `fontsDATA`)
 VALUES 
 ('2',
 'Arial',
 '14',
 '1.5',
 'black',
 'dark gray ',
 '4.5',
 'usual',
 'completely',
 '2',
 load_file('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\resetmysql.txt'),
 'Some',
 '2020-12-10');
 