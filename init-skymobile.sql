--------------------------------------------------------------------
-- Для первичного запуска для Skymobile -----------------------------
--------------------------------------------------------------------
SET search_path = "games";
--------------------------------------------------------------------

-- @formatter:off
TRUNCATE game RESTART IDENTITY CASCADE;
TRUNCATE category RESTART IDENTITY CASCADE;
TRUNCATE translation RESTART IDENTITY CASCADE;
TRUNCATE event_type RESTART IDENTITY CASCADE;
--------------------------------------------------------------------
INSERT INTO games.event_type (code, active)
VALUES  ('GAME_START', false),
        ('GAME_CLOSE', false),
        ('GAME_PAUSE', false),
        ('GAME_CONTINUE', false),
        ('GAME_HIDE', false),
        ('GAME_UNHIDE', false),
        ('APPLICATION_CLOSED', false);
--------------------------------------------------------------------
INSERT INTO games.category (id, code, description, title, priority, active)
VALUES
    (1, 'NEW', 'Жаңы оюндар', 'Жаңы чыккандар 🎉', 8, false),
    (2, 'RECOMMEND', 'Сунушталган оюндар', 'Сунуштайбыз 💡', 9, false),
    (3, 'ALL', 'Бардык оюндар', 'Бардыгы', 5, true),
    (4, 'PAID', 'Сыйлыктуу төлөм оюндар', 'Сыйлык менен оюндар 💰', 7, false);
SELECT SETVAL('category_id_seq', COALESCE((SELECT MAX(id) + 1 FROM games.category), 1), FALSE);
--------------------------------------------------------------------
INSERT INTO game (id, code, title, subtitle, description, status, type, genre, priority, price, price_text, play, icon, charge_period, cover, offer, has_wof, has_leaderboard, on_added, on_updated, reference, studio)
VALUES
    (1, 'ONETFRUITCLASSIC', 'Жемиш түгөйлөрү', 'Акысыз', 'Сиздин сүйүктүү пазл оюнуңуз эми Beeline''да! Тезирээк мөмө-жемиштерди ачып, жуптарга бөлүңүз. Бирок эсиңизде болсун: экиден ашык эмес бурулуш!', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/onetfruitclassic/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/onetfruitclassic_128px.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (2, 'SUMOSAGA', 'Ниндзя Сага 2: Жемиш өчү', 'Акысыз', 'Ниндзяга мүмкүн болушунча бийик секирип, белек чогултууга жардам бер! Бул кооптуу дүйнөдө аман калуу үчүн тез жана шамдагай болушуң керек.', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/sumosaga/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/ninja_saga2_icon_128.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (3, 'NAURYZBAIGE', 'Ас байге', 'Акысыз', 'Сүйүктүү шаарың боюнча ат минип чурка да, Нооруз майрамына дасторкон жыйна!', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/nauryzbaige/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/nauryzbaige_icon128_10kb.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (4, 'BIGFISH', 'Чоң Балык', 'Акысыз', 'Сен акуласың! Кичирээк балыктарды жеп, өсөсүң. Медуза, балыкчы жана чоң балыктардан сак бол.', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/bigfish/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/shark_icon_v2_128.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (5, 'HEX_MERGE', 'Сандар сыйкыры 2048 🎁', 'Акысыз', 'Культтук 2048 баш катырмасынын жаңы түрү! Android 6.3.1 жана iOS 7.0.2 менен мегабайттарды утуп ал.', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/hex_merge/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/hexamerge-icon-128.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (6, 'MARBLES', 'Котосферы', 'Акысыз', 'Сүйкүмдүү мышыктарды бириктирип, дагы да көп сүйкүмдүү мышыктарды ал!', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/marbles/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/marbles_icon128.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (7, 'ZOOMERGE', 'Жаныбарлар', 'Акысыз', 'Фермаңдагы бардык жаныбарларды чогулт! Жаңы жаныбарларга жетүү үчүн жаныбарларды бириктирүү зарыл. Фермада орун чектелүү экенин унутпа.', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/zoomerge/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/zoomerge_icon.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (8, 'CROSSYCHINKEN', 'Жолду кесип өт! 🎁', 'Акысыз', 'Кенедей сүйкүмдүү жөжө жолду кесип өткүсү келет. Android 6.3.1 жана iOS 7.0.2 менен мегабайттарды утуп ал.', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/crossychinken/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/crossychicken_128_7kb.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (9, 'JEWELMATCH', 'Асыл таш катары', 'Акысыз', 'Асыл таштарды катарга тиз! Android 6.3.1 жана iOS 7.0.2 менен мегабайттарды утуп ал.', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/jewelmatch/', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/jewel_match_icon_2023_128.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE'),
    (10, 'RACING', 'Шашечки', 'Акысыз', 'Жолдо баарын озуп кет! Манёврлар, ылдамдык, драйв — жолдо ким кожоюн экенин далилде!', 'ACTIVE', 'FREE', 'MATCH', '50', '0', 'Акысыз', '/play/racing/', 'https://gaming.beeline.kz/filestore/game-platform-export/icons/Icon_shashechki_128px.png', 'DAY', '-', '-', 'False', 'False', now(), NULL, NULL, 'QAZCODE');

SELECT SETVAL('game_id_seq', COALESCE((SELECT MAX(id) + 1 FROM games.game), 1), FALSE);
--------------------------------------------------------------------
INSERT INTO games.game_category (game, category, priority)
VALUES  (1, 3, 1),
        (2, 3, 2),
        (3, 3, 3),
        (4, 3, 4),
        (5, 3, 5),
        (6, 3, 6),
        (7, 3, 7),
        (8, 3, 8),
        (9, 3, 9);
--------------------------------------------------------------------
INSERT INTO games.translation (language, key, value)
VALUES
-- Категории
('ru', 'category.description.ALL', 'Все игры'),
('kg', 'category.description.ALL', 'Бардык оюндар'),
('ru', 'category.description.NEW', 'Новые игры'),
('kg', 'category.description.NEW', 'Жаңы оюндар'),
('ru', 'category.description.PAID', 'Платные игры с призами'),
('kg', 'category.description.PAID', 'Белектер менен акы төлөнүүчү оюндар'),
('ru', 'category.description.RECOMMEND', 'Рекомендуемые игры'),
('kg', 'category.description.RECOMMEND', 'Сунушталган оюндар'),
('ru', 'category.title.ALL', 'Все'),
('kg', 'category.title.ALL', 'Баары'),
('ru', 'category.title.NEW', 'Новинки 🎉'),
('kg', 'category.title.NEW', 'Жаңылар 🎉'),
('ru', 'category.title.PAID', 'Игры с наградами 💰'),
('kg', 'category.title.PAID', 'Белектер менен оюндар 💰'),
('ru', 'category.title.RECOMMEND', 'Рекомендуем 💡'),
('kg', 'category.title.RECOMMEND', 'Сунуштайбыз 💡'),

-- Жанры
('ru', 'game.genre.ACTION', 'Экшн'),
('kg', 'game.genre.ACTION', 'Экшн'),

('ru', 'game.genre.INTELLECTUAL', 'Интеллектуальная'),
('kg', 'game.genre.INTELLECTUAL', 'Интеллектуалдуу'),

('ru', 'game.genre.MATCH', 'Матч'),
('kg', 'game.genre.MATCH', 'Мач'),

('ru', 'game.genre.UNDEFINED', 'Неопределенный'),
('kg', 'game.genre.UNDEFINED', 'Аныкталбаган'),

-- Статусы
('ru', 'game.status.ACTIVE', 'Активный'),
('kg', 'game.status.ACTIVE', 'Активдүү'),

('ru', 'game.status.DISABLED', 'Отключен'),
('kg', 'game.status.DISABLED', 'Өчүрүлгөн'),

-- Свойства
('ru', 'game.property.title.REWARD', 'Награда'),
('kg', 'game.property.title.REWARD', 'Сыйлык'),

('ru', 'game.property.title.COST', 'Стоимость'),
('kg', 'game.property.title.COST', 'Наркы'),

('ru', 'game.property.title.GAME_AMOUNT', 'Количество игр'),
('kg', 'game.property.title.GAME_AMOUNT', 'Оюндардын саны'),

('ru', 'game.property.title.WOF', 'Колесо фортуны'),
('kg', 'game.property.title.WOF', 'Бакыт дөңгөлөгү'),

-- Ошибки
('ru', 'error.capital.english.language', 'Текст в поле %s должен содержать только латинские заглавные буквы и подчеркивания'),
('kg', 'error.capital.english.language', 'Текст %s талаасында чоң латын тамгалары жана сызыктар гана болушу керек'),
('ru', 'error.not.empty', 'Поле %s не должно быть пустым'),
('kg', 'error.not.empty', '%s талаасы бош болбошу керек'),
('ru', 'error.symbol.length', 'Количество символов в поле %s не должно превышать %s'),
('kg', 'error.symbol.length', '%s талаасындагы белгилердин саны %sден ашпашы керек'),
('ru', 'error.type.enum.not.match', 'Поле %s должно быть одним из значений: %s, но передано: %s'),
('kg', 'error.type.enum.not.match', '%s талаасы мааниси төмөнкү маанилердин бири болушу керек: %s, бирок берилген: %s'),
('ru', 'error.type.not.match', 'Поле %s должно быть типа %s, но передано: %s'),
('kg', 'error.type.not.match', '%s талаасынын тиби %s болушу керек, бирок берилди: %s'),
('ru', 'error.wof.property.found', 'Передано hasWof=false, но свойство колеса удачи указано'),
('kg', 'error.wof.property.found', 'hasWof=false берилди, бирок "бакыт дөңгөлөгү" касиети көрсөтүлгөн'),
('ru', 'error.wof.property.not.found', 'Передано hasWof=true, но свойство колеса удачи не указано'),
('kg', 'error.wof.property.not.found', 'hasWof=true берилди, бирок "бакыт дөңгөлөгү" касиети берилген эмес'),

-- Контекст авторизации
('ru', 'error.authorization.context.not.found', 'Не найден контекст авторизации'),
('kg', 'error.authorization.context.not.found', 'Авторизация контексти табылган жок'),

-- Неверный текущий пароль
('ru', 'error.current.password.incorrect', 'Текущий пароль неверен'),
('kg', 'error.current.password.incorrect', 'Учурдагы сырсөз туура эмес'),

-- Игра не найдена
('ru', 'error.game.not.found', 'Игра с кодом %s не найдена'),
('kg', 'error.game.not.found', '%s коду менен оюн табылган жок'),

-- Учетка уже существует
('ru', 'error.manager.already.exists', 'Учетная запись уже существует'),
('kg', 'error.manager.already.exists', 'Эсеп жазуу мурунтан эле бар'),

-- Учетка отключена
('ru', 'error.manager.is.disabled', 'Учетная запись менеджера [%s] отключена'),
('kg', 'error.manager.is.disabled', 'Менеджердин эсеп жазуусу [%s] өчүрүлгөн'),

-- Учетка не найдена
('ru', 'error.manager.not.found', 'Учетная запись не найдена'),
('kg', 'error.manager.not.found', 'Эсеп жазуу табылган жок'),

-- Новый пароль совпадает со старым
('ru', 'error.password.duplicate', 'Новый пароль не должен совпадать с текущим паролем'),
('kg', 'error.password.duplicate', 'Жаңы сырсөз учурдагы сырсөз менен бирдей болбошу керек'),

-- Валидация пароля
('ru', 'error.password.validation', 'Пароль должен содержать не менее 8 символов, включая 1 заглавную букву, 1 строчную букву, 1 цифру и 1 специальный символ'),
('kg', 'error.password.validation', 'Сырсөздө кеминде 8 белгиден турушу керек: 1 баш тамга, 1 кичине тамга, 1 цифра жана 1 атайын символ'),

-- Порог должен быть больше нуля
('ru', 'error.threshold.value.incorrect', 'Пороговое значение должно быть больше нуля'),
('kg', 'error.threshold.value.incorrect', 'Порог мааниси нөлдөн чоң болушу керек'),

-- Код игры уже существует
('ru', 'error.wof.game.config.existing', 'Код игры уже существует'),
('kg', 'error.wof.game.config.existing', 'Оюндун коду мурунтан эле бар'),

-- Конфигурация игры не найдена
('ru', 'error.wof.game.config.not.found', 'Конфигурация игры с id %s не найдена'),
('kg', 'error.wof.game.config.not.found', 'id %s менен оюндун конфигурациясы табылган жок'),

-- Неверный логин или пароль
('ru', 'error.authentication.failed', 'Неверный логин или пароль'),
('kg', 'error.authentication.failed', 'Логин же сырсөз туура эмес'),

-- Нет оставшихся попыток
('ru', 'error.wof.not.enough_attempts', 'На текущий момент закончились попытки'),
('kg', 'error.wof.not.enough_attempts', 'Учурда сизде аракеттер калбай калды'),

-- Game Category
('ru', 'game.category.description.ALL', 'Все игры'),
('kg', 'game.category.description.NEW', 'Жаңы оюндар'),
('kg', 'game.category.description.PAID', 'Белектер менен акы төлөнүүчү оюндар'),
('kg', 'game.category.description.RECOMMEND', 'Сунушталган оюндар'),
('ru', 'game.category.title.ALL', 'Все'),
('kg', 'game.category.title.NEW', 'Жаңылар 🎉'),
('kg', 'game.category.title.PAID', 'Оюндар жана белектер 💰'),
('kg', 'game.category.title.RECOMMEND', 'Сунуштайбыз 💡'),

-- Периоды подписки
('ru', 'game.chargePeriod.DAY', 'День'),
('kg', 'game.chargePeriod.DAY', 'Күн'),
('ru', 'game.chargePeriod.MONTH', 'Месяц'),
('kg', 'game.chargePeriod.MONTH', 'Ай'),
('ru', 'game.chargePeriod.WEEK', 'Неделя'),
('kg', 'game.chargePeriod.WEEK', 'Жума'),
('ru', 'game.chargePeriod.YEAR', 'Год'),
('kg', 'game.chargePeriod.YEAR', 'Жыл'),

-- Типы игр
('ru', 'game.type.FREE', 'Бесплатно'),
('kg', 'game.type.FREE', 'Акысыз'),
('ru', 'game.type.SUBSCRIPTION', 'Подписка'),
('kg', 'game.type.SUBSCRIPTION', 'Жазылуу'),

-- Статусы турниров
('ru', 'tournament.extendedStatus.ARCHIVED', 'Архивирован'),
('kg', 'tournament.extendedStatus.ARCHIVED', 'Архивделген'),
('ru', 'tournament.extendedStatus.FINISHED', 'Завершён'),
('kg', 'tournament.extendedStatus.FINISHED', 'Аякталды'),
('ru', 'tournament.extendedStatus.NONACTIVE', 'Неактивен'),
('kg', 'tournament.extendedStatus.NONACTIVE', 'Иштебейт'),
('ru', 'tournament.extendedStatus.RUNNING', 'В процессе'),
('kg', 'tournament.extendedStatus.RUNNING', 'Уланууда'),
('ru', 'tournament.extendedStatus.SCHEDULED', 'Запланирован'),
('kg', 'tournament.extendedStatus.SCHEDULED', 'Пландалган'),

-- Основные статусы турнира
('ru', 'tournament.status.ACTIVE', 'Активный'),
('kg', 'tournament.status.ACTIVE', 'Активдүү'),
('ru', 'tournament.status.NONACTIVE', 'Неактивный'),
('kg', 'tournament.status.NONACTIVE', 'Иштебейт'),
('ru', 'tournament.status.PLAYED', 'Сыгран'),
('kg', 'tournament.status.PLAYED', 'Ойнолду'),

-- Тип турнира
('ru', 'tournament.type.AMOUNT', 'По количеству'),
('kg', 'tournament.type.AMOUNT', 'Сан боюнча'),
('ru', 'tournament.type.HIGH_SCORE', 'По наибольшему счёту'),
('kg', 'tournament.type.HIGH_SCORE', 'Жогорку упай боюнча'),

-- GAMES
-- BIGFISH
('ru', 'game.icon.BIGFISH', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/shark_icon_v2_128.png'),
('ru', 'game.price.BIGFISH', 'Бесплатно'),
('ru', 'game.description.BIGFISH', 'Ты акула! Ешь рыб поменьше и расти. Остерегайся медуз, рыбаков и рыб побольше.'),
('ru', 'game.subtitle.BIGFISH', 'Бесплатно'),
('ru', 'game.title.BIGFISH', 'Большая Рыба'),

('kg', 'game.icon.BIGFISH', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/shark_icon_v2_128.png'),
('kg', 'game.title.BIGFISH', 'Чоң балык'),
('kg', 'game.subtitle.BIGFISH', 'Акысыз'),
('kg', 'game.description.BIGFISH', 'Сен акуласың! Кичирээк балыктарды жеп, өсөсүң. Медуза, балыкчы жана чоң балыктардан сак бол.'),
('kg', 'game.price.BIGFISH', 'Акысыз'),

-- CROSSYCHINKEN
('ru', 'game.icon.CROSSYCHINKEN', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/crossychicken_128_7kb.png'),
('ru', 'game.title.CROSSYCHINKEN', 'Перейди дорогу! 🎁'),
('ru', 'game.subtitle.CROSSYCHINKEN', 'Бесплатно'),
('ru', 'game.description.CROSSYCHINKEN', 'Махонький милый цыплёнок хочет перейти дорогу. С Android 6.3.1 и iOS 7.0.2 можно выигрывать мегабайты.'),
('ru', 'game.price.CROSSYCHINKEN', 'Бесплатно'),

('kg', 'game.icon.CROSSYCHINKEN', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/crossychicken_128_7kb.png'),
('kg', 'game.title.CROSSYCHINKEN', 'Жолду кесип өт! 🎁'),
('kg', 'game.subtitle.CROSSYCHINKEN', 'Акысыз'),
('kg', 'game.description.CROSSYCHINKEN', 'Кенедей сүйкүмдүү жөжө жолду кесип өткүсү келет. Android 6.3.1 жана iOS 7.0.2 менен мегабайттарды утуп ал.'),
('kg', 'game.price.CROSSYCHINKEN', 'Акысыз'),

-- HEX_MERGE
('ru', 'game.icon.HEX_MERGE', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/hexamerge-icon-128.png'),
('ru', 'game.description.HEX_MERGE', 'Культовая головоломка 2048 в новом обличии! С Android 6.3.1 и iOS 7.0.2 можно выигрывать мегабайты.'),
('ru', 'game.price.HEX_MERGE', 'Бесплатно'),
('ru', 'game.subtitle.HEX_MERGE', 'Бесплатно'),
('ru', 'game.title.HEX_MERGE', 'Магия чисел 2048 🎁'),

('kg', 'game.icon.HEX_MERGE', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/hexamerge-icon-128.png'),
('kg', 'game.title.HEX_MERGE', 'Сандар сыйкыры 2048 🎁'),
('kg', 'game.subtitle.HEX_MERGE', 'Акысыз'),
('kg', 'game.description.HEX_MERGE', 'Культтук 2048 баш катырмасынын жаңы түрү! Android 6.3.1 жана iOS 7.0.2 менен мегабайттарды утуп ал.'),
('kg', 'game.price.HEX_MERGE', 'Акысыз'),

-- JEWELMATCH
('ru', 'game.icon.JEWELMATCH', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/jewel_match_icon_2023_128.png'),
('ru', 'game.description.JEWELMATCH', 'Выстраивай камни в драгоценные ряды! С Android 6.3.1 и iOS 7.0.2 можно выигрывать мегабайты.'),
('ru', 'game.subtitle.JEWELMATCH', 'Бесплатно'),
('ru', 'game.title.JEWELMATCH', 'Драгоценный ряд 🎁'),
('ru', 'game.price.JEWELMATCH', 'Бесплатно'),

('kg', 'game.icon.JEWELMATCH', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/jewel_match_icon_2023_128.png'),
('kg', 'game.price.JEWELMATCH', 'Акысыз'),
('kg', 'game.subtitle.JEWELMATCH', 'Акысыз'),
('kg', 'game.description.JEWELMATCH', 'Асыл таштарды катарга тиз! Android 6.3.1 жана iOS 7.0.2 менен мегабайттарды утуп ал.'),
('kg', 'game.title.JEWELMATCH', 'Асыл таш катары'),

-- MARBLES
('ru', 'game.icon.MARBLES', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/marbles_icon128.png'),
('ru', 'game.description.MARBLES', 'Соединяйте милых котиков, чтобы получить ещё больше милых котиков!'),
('ru', 'game.price.MARBLES', 'Бесплатно'),
('ru', 'game.subtitle.MARBLES', 'Бесплатно'),
('ru', 'game.title.MARBLES', 'Котосферы'),

('kg', 'game.icon.MARBLES', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/marbles_icon128.png'),
('kg', 'game.title.MARBLES', 'Котосферы'),
('kg', 'game.subtitle.MARBLES', 'Акысыз'),
('kg', 'game.description.MARBLES', 'Сүйкүмдүү мышыктарды бириктирип, дагы да көп сүйкүмдүү мышыктарды ал!'),
('kg', 'game.price.MARBLES', 'Акысыз'),

-- NAURYZBAIGE
('ru', 'game.icon.NAURYZBAIGE', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/nauryzbaige_icon128_10kb.png'),
('ru', 'game.title.NAURYZBAIGE', 'Ас байге'),
('ru', 'game.subtitle.NAURYZBAIGE', 'Бесплатно'),
('ru', 'game.description.NAURYZBAIGE', 'Мчись на коне по любимому городу и собери дастархан к Празднику Наурыз!'),
('ru', 'game.price.NAURYZBAIGE', 'Бесплатно'),

('kg', 'game.icon.NAURYZBAIGE', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/nauryzbaige_icon128_10kb.png'),
('kg', 'game.title.NAURYZBAIGE', 'Ас байге'),
('kg', 'game.subtitle.NAURYZBAIGE', 'Акысыз'),
('kg', 'game.description.NAURYZBAIGE', 'Сүйүктүү шаарың боюнча ат минип чурка да, Нооруз майрамына дасторкон жыйна!'),
('kg', 'game.price.NAURYZBAIGE', 'Акысыз'),

-- SUMOSAGA
('ru', 'game.icon.SUMOSAGA', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/ninja_saga2_icon_128.png'),
('ru', 'game.price.SUMOSAGA', 'Бесплатно'),
('ru', 'game.description.SUMOSAGA', 'Помоги ниндзе запрыгнуть как можно выше собирая на пути подарки! И помни, ты должен быть быстрым и ловким, чтобы выжить в этом опасном мире.'),
('ru', 'game.subtitle.SUMOSAGA', 'Бесплатно'),
('ru', 'game.title.SUMOSAGA', 'Ниндзя Сага 2: Фруктовая месть'),

('kg', 'game.icon.SUMOSAGA', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/ninja_saga2_icon_128.png'),
('kg', 'game.title.SUMOSAGA', 'Ниндзя Сага 2: Жемиш өчү'),
('kg', 'game.subtitle.SUMOSAGA', 'Акысыз'),
('kg', 'game.description.SUMOSAGA', 'Ниндзяга мүмкүн болушунча бийик секирип, белек чогултууга жардам бер! Бул кооптуу дүйнөдө аман калуу үчүн тез жана шамдагай болушуң керек.'),
('kg', 'game.price.SUMOSAGA', 'Акысыз'),

-- ZOOMERGE
('ru', 'game.icon.ZOOMERGE', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/zoomerge_icon.png'),
('ru', 'game.title.ZOOMERGE', 'Зверушки'),
('ru', 'game.subtitle.ZOOMERGE', 'Бесплатно'),
('ru', 'game.description.ZOOMERGE', 'Собери всех животных на своей ферме! Вам предстоит соединять животных между собой для получения доступа к новым. Будьте внимательны, место на ферме ограничено.'),
('ru', 'game.price.ZOOMERGE', 'Бесплатно'),

('kg', 'game.icon.ZOOMERGE', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/zoomerge_icon.png'),
('kg', 'game.title.ZOOMERGE', 'Жаныбарлар'),
('kg', 'game.subtitle.ZOOMERGE', 'Акысыз'),
('kg', 'game.description.ZOOMERGE', 'Фермаңдагы бардык жаныбарларды чогулт! Жаңы жаныбарларга жетүү үчүн жаныбарларды бириктирүү зарыл. Фермада орун чектелүү экенин унутпа.'),
('kg', 'game.price.ZOOMERGE', 'Акысыз'),

-- RACING
('ru', 'game.title.RACING', 'Гоночки'),
('ru', 'game.icon.RACING', 'https://gaming.beeline.kz/filestore/game-platform-export/icons/Icon_shashechki_128px.png'),
('ru', 'game.price.RACING', 'Бесплатно'),
('ru', 'game.description.RACING', 'Обгони всех в потоке! Маневры, скорость и драйв - докажи, кто главный на дороге'),
('ru', 'game.subtitle.RACING', 'Бесплатно'),

('kg', 'game.title.RACING', 'Шашечки'),
('kg', 'game.icon.RACING', 'https://gaming.beeline.kz/filestore/game-platform-export/icons/Icon_shashechki_128px.png'),
('kg', 'game.price.RACING', 'Акысыз'),
('kg', 'game.description.RACING', 'Жолдо баарын озуп кет! Манёврлар, ылдамдык, драйв — жолдо ким кожоюн экенин далилде!'),
('kg', 'game.subtitle.RACING', 'Акысыз'),

-- ONETFRUITCLASSIC
('ru', 'game.title.ONETFRUITCLASSIC', 'Фрутопара'),
('ru', 'game.description.ONETFRUITCLASSIC', 'Любимая головоломка теперь в Beeline! Скорее открывай и соединяй фрукты в пары. Но помни: не больше двух поворотов!'),
('ru', 'game.subtitle.ONETFRUITCLASSIC', 'Бесплатно'),
('ru', 'game.price.ONETFRUITCLASSIC', 'Бесплатно'),
('ru', 'game.icon.ONETFRUITCLASSIC', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/onetfruitclassic_128px.png'),

('kg', 'game.title.ONETFRUITCLASSIC', 'Жемиш түгөйлөрү'),
('kg', 'game.description.ONETFRUITCLASSIC', 'Сиздин сүйүктүү пазл оюнуңуз эми Beeline''да! Тезирээк мөмө-жемиштерди ачып, жуптарга бөлүңүз. Бирок эсиңизде болсун: экиден ашык эмес бурулуш!'),
('kg', 'game.subtitle.ONETFRUITCLASSIC', 'Акысыз'),
('kg', 'game.price.ONETFRUITCLASSIC', 'Акысыз'),
('kg', 'game.icon.ONETFRUITCLASSIC', 'https://game-platform.s3.eu-north-1.amazonaws.com/icons/game/onetfruitclassic_128px.png');
--------------------------------------------------------------------
-- @formatter:on