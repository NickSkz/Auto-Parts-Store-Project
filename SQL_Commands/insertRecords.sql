CALL insert_highercategory('Filtry');
CALL insert_highercategory('Chłodzenie');
CALL insert_highercategory('Zawieszenie');
CALL insert_highercategory('Układ Hamulcowy');
CALL insert_highercategory('Silnik');
CALL insert_highercategory('Sprzęgło');
CALL insert_highercategory('Układ kierowniczy');
CALL insert_highercategory('Nadwozie');
CALL insert_highercategory('Paliwo');
CALL insert_highercategory('Inne');



CALL insert_category(1, 'Filtry oleju');
CALL insert_category(1, 'Filtry powietrza');
CALL insert_category(1, 'Filtry paliwa');

CALL insert_category(2, 'Termostaty');
CALL insert_category(2, 'Płyny chłodnicze');
CALL insert_category(2, 'Pompy wody');

CALL insert_category(3, 'Amortyzatory');
CALL insert_category(3, 'Wahacze');
CALL insert_category(3, 'Sprężyny zawieszenia');
CALL insert_category(3, 'Łożysko koła');

CALL insert_category(4, 'Płyny hamulcowe');
CALL insert_category(4, 'Bębny hamulcowe');
CALL insert_category(4, 'Klocki hamulcowe');
CALL insert_category(4, 'Tarcze hamulcowe');

CALL insert_category(5, 'Turbosprężarki');
CALL insert_category(5, 'Maska olejowa');
CALL insert_category(5, 'Łańcuch rozrządu');
CALL insert_category(5, 'Uszczelki');

CALL insert_category(6, 'Koła zamachowe');
CALL insert_category(6, 'Łożyska');
CALL insert_category(6, 'Pompy sprzęgła');

CALL insert_category(7, 'Drążki kierownicze');
CALL insert_category(7, 'Czujniki kąta skrętu');
CALL insert_category(7, 'Pompy wspomagania');
CALL insert_category(7, 'Przekładnie kierownicze');

CALL insert_category(8, 'Drzwi');
CALL insert_category(8, 'Zderzaki');
CALL insert_category(8, 'Błotniki');
CALL insert_category(8, 'Lusterka');
CALL insert_category(8, 'Pokrywy silnika i bagażnika');

CALL insert_category(9, 'Pompy wtryskowe');
CALL insert_category(9, 'Wtryskiwacze');
CALL insert_category(9, 'Przepływomierze powietrza');

CALL insert_category(10, 'Inne');



CALL insert_manufacturer('Magneti Marelli', 'Włochy');
CALL insert_manufacturer('Bosch', 'Niemcy');
CALL insert_manufacturer('Webasto', 'Niemcy');
CALL insert_manufacturer('Nissan Motor', 'Japonia');
CALL insert_manufacturer('Hyundai', 'Korea Południowa');
CALL insert_manufacturer('Buehler Motor', 'Niemcy');
CALL insert_manufacturer('Volkswagen AG', 'Niemcy');
CALL insert_manufacturer('Mercedes-Benz', 'Niemcy');
CALL insert_manufacturer('BMW', 'Niemcy');
CALL insert_manufacturer('Mirek & Syn', 'Polska');


CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Płyny Chłodnicze'), 1);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wahacze'), 1);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Uszczelki'), 1);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łożyska'), 1);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wtryskiwacze'), 1);


CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drzwi'), 2);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Zderzaki'), 2);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Błotniki'), 2);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Lusterka'), 2);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Inne'), 2);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Termostaty'), 3);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Płyny Chłodnicze'), 3);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy Wody'), 3);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Amortyzatory'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Tarcze hamulcowe'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Klocki hamulcowe'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Turbosprężarki'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łańcuch rozrządu'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy sprzęgła'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wtryskowe'), 4);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wtryskiwacze'), 4);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Amortyzatory'), 5);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Tarcze hamulcowe'), 5);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Bębny hamulcowe'), 5);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łańcuch rozrządu'), 5);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wtryskowe'), 5);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wtryskiwacze'), 5);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Filtry oleju'), 6);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Filtry paliwa'), 6);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Filtry powietrza'), 6);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Sprężyny zawieszenia'), 6);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łożysko koła'), 6);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Koła zamachowe'), 6);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łożyska'), 6);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Termostaty'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wody'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Amortyzatory'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wahacze'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łożysko koła'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Turbosprężarki'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Maska olejowa'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łańcuch rozrządu'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Koła zamachowe'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy sprzęgła'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wspomagania'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Przekładnie kierownicze'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drzwi'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Zderzaki'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pokrywy silnika i bagażnika'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wtryskowe'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Przepływomierze powietrza'), 7);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Inne'), 7);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Termostaty'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wody'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Amortyzatory'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wahacze'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Sprężyny zawieszenia'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Turbosprężarki'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Maska olejowa'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łańcuch rozrządu'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łożyska'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Koła zamachowe'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy sprzęgła'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wspomagania'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Przekładnie kierownicze'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drzwi'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Zderzaki'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pokrywy silnika i bagażnika'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wtryskowe'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Przepływomierze powietrza'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Inne'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drążki kierownicze'), 8);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Czujniki kąta skrętu'), 8);



CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Filtry oleju'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Filtry powietrza'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Termostaty'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wody'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Amortyzatory'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wahacze'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Płyny hamulcowe'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Bębny hamulcowe'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łożysko koła'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Turbosprężarki'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Maska olejowa'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Łańcuch rozrządu'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Koła zamachowe'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy sprzęgła'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wspomagania'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Przekładnie kierownicze'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drzwi'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Zderzaki'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pokrywy silnika i bagażnika'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wtryskowe'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Przepływomierze powietrza'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Inne'), 9);

CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drzwi'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Zderzaki'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Błotniki'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Lusterka'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy wtryskowe'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pompy sprzęgła'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Turbosprężarki'), 9);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Klocki hamulcowe'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Bębny hamulcowe'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Wahacze'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Drążki kierownicze'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Czujniki kąta skrętu'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Pokrywy silnika i bagażnika'), 10);
CALL insert_categoryproducent((SELECT category_id from category WHERE `name`='Inne'), 10);