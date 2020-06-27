; see engine/naming_screen.asm

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z -"
	db "ä ö ü ? ! . , ( )"
	db "GROß  LÖSCH ENDE "

BoxNameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "ä ö ü ( ) ; /   0"
	db "1 2 3 4 5 6 7 8 9"
	db "GROß  LÖSCH ENDE "

NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z /"
	db "Ä Ö Ü <PK> <MN> : × [ ]"
	db "klein LÖSCH ENDE "

BoxNameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z ß"
	db "Ä Ö Ü [ ] : × <PK> <MN>"
	db "- ? ! ♂ ♀ . , &  "
	db "klein LÖSCH ENDE "
