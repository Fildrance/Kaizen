INSERT INTO kaizen.skill.ways (id, name, short_description, is_active) VALUES (1, N'Разработчик', N'Разработка ПО, архитектура модулей и приложений', true);

INSERT INTO kaizen.skill.grades (id, name, short_description,  is_active) VALUES (1, N'Младший Разработчик', N'Разработка модулей ПО по готовым дизайнам, фикс багов, помощь в работе по документации.',  true);
INSERT INTO kaizen.skill.grades (id, name, short_description,  is_active) VALUES (2, N'Middle-Разработчик', N'Участие в проектировании модулей ПО, разработка модулей ПО, оценка по модулям ПО, составление тех. документации, участие в планировании',  true);
INSERT INTO kaizen.skill.grades (id, name, short_description,  is_active) VALUES (3, N'Разработчик-стажер', N'Работа над точечными задачами и внутренней автоматизацией отдела',true);
INSERT INTO kaizen.skill.grades (id, name, short_description,  is_active) VALUES (4, N'Старший разработчик', N'Проектирование ИС и разбиения по модулям, оценка сметы по проекту в части архитектуры и разработки, разработка сложных модулей ПО',  true);

INSERT INTO kaizen.skill.grades_in_ways (grade_id, way_id, order_in_way) VALUES (1,1, 1);
INSERT INTO kaizen.skill.grades_in_ways (grade_id, way_id, order_in_way) VALUES (2,1, 2);
INSERT INTO kaizen.skill.grades_in_ways (grade_id, way_id, order_in_way) VALUES (3,1, 0);
INSERT INTO kaizen.skill.grades_in_ways (grade_id, way_id, order_in_way) VALUES (4,1, 3);

INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (1, N'Стандартные библиотеки .NET', N'Станадртная функциональность, предлагаемая .NET Framework, а так же смежные технологии Microsoft - наш web-stack в частности.', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (2, N'Third-party libraries', N'', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (3, N'Общие технологии', N'', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (4, N'Инструменты разработчика', N'', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (5, N'Ресурсы компании', N'', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (6, N'Паттерны и архитектура', N'', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (7, N'Работа в команде', N'', true);
INSERT INTO kaizen.skill.skill_categories(id, name, short_description, is_active) VALUES (8, N'Front-end', N'', true);

INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (1, N'Stream (потоковая обработка)	', N'Работа с потоками - практика, понимание механизмов и принципов, закладываемых в работу потоков.', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (2, N'Reflection/Expression', N'Работа с рефлексией в целом, атрибутами, Expression.', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (3, N'Синтаксис и спецификация C#', N'', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (4, N'System.Collections/LINQ', N'Работа с коллекциями стандартными способами', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (5, N'Работа с XML в коде', N'', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (6, N'Многопоточность', N'', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (7, N'Конфигурация, Ресурсы, Encoding, CultureInfо, Работа со временем', N'Вспомогательные механизмы .NET Framework', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (8, N'ADO.NET', N'', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (9, N'AppDomain, Assembly и их сборка', N'', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (10, N'Веб-сервисы в .NET', N'WCF, WebApi 2.0 & HttpClient', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (11, N'WPF', N'Фреймворк для построения декстопных приложений', N'', 1, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (12, N'Сериализация и NewtonsoftJson', N'', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (13, N'EntityFramework и работа с БД в .NET', N'Миграции, конфигурации', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (14, N'NLog', N'Фреймворк для логирования	', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (15, N'Dependency injection container', N'Контейнер зависимостей - например, StructureMap', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (16, N'SignalR', N'Фреймворк Microsoft для онлайнового взаимодействия типа "клиент-сервер"', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (17, N'css, sccs', N'Основы для стилистического оформления приложений компании', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (18, N'Тестирование', N'Фреймворки юнит тестирования и изоляционный фреймворк', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (19, N'Quartz', N'', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (20, N'DevExtreme', N'', N'', 2, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (21, N'XML/XSD', N'Работа с XML-related стандартами - чтение и написание', N'<p>XML формат и XSD - умение работы как с помощью специацлизированного программного обеспечения, так и без него.<br/><br/>XSLT - понимание принципов работы xslt, умение писать простые xslt трансформации<br/><br/>XPath - Язык выражений для поиска элементов и навигации в xml документах - умение описывать требуемые элменты в структуре html через xpath, делать xpath гибки и не хрупким.<br/><br/>JSON format - умение читать и составлять JSON, а так же знание смежных технологий (JSON Schema)<br/><br/>Язык описания веб-сервисов и доступа к ним, основанный на языке XML - понимание структуры soap-запросов, умение писать и читать wsdl. Работа с SOAP UI.</p>', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (22, N'Web Services', N'Использование связанных с веб-сервисами технологий', N'', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (23, N'Сетевые протоколы (-)', N'', N'', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (24, N'Работа с IIS и Windows (-)', N'', N'<p><br/></p><p>windows</p><p><!--[if !supportLists]--><span style="color: #172b4d;">·<span>         </span></span><!--[endif]--><span style="font-size: 10.5pt;color: #172b4d;">firewall<br/></span>·         <span style="font-size: 10.5pt;">sheduling задач в винде<br/></span>·         <span style="font-size: 10.5pt;">права доступа (в винде)<br/></span>·         <span style="font-size: 10.5pt;">запуск/остановка регистрация/дерегистрация сервисов<br/></span>·         <span style="font-size: 10.5pt;">Регистр Windows</span></p><p>iis</p><p><!--[if !supportLists]--><span style="color: #172b4d;">·<span>         </span></span><!--[endif]--><span style="font-size: 10.5pt;color: #172b4d;">authentification<br/></span>·         <span style="font-size: 10.5pt;">certificates<br/></span>·         <span style="font-size: 10.5pt;">app pool<br/></span>·         <span style="font-size: 10.5pt;">site / virtual directories<br/></span>·         <span style="font-size: 10.5pt;">mime type<br/></span>·         <span style="font-size: 10.5pt;">session<br/></span>·         <span style="font-size: 10.5pt;">module, handler<br/></span>·         <span style="font-size: 10.5pt;">url rewrite</span></p>', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (25, N'SQL Server (-)', N'', N'<p><br/></p><p><br/></p><!--StartFragment--><p style="font-size: 14px;text-align: left;"><span class="inline-comment-marker">Диаграммы</span></p><p style="font-size: 14px;text-align: left;"><span class="inline-comment-marker">Партиционирование</span></p><!--EndFragment--><p><br/></p><p><br/></p>', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (26, N'Работы по документации', N'Участие в работе с документацией по проекту', N'', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (27, N'Нотации для диаграмм', N'', N'', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (28, N'Работа с СУБД', N'', N'', 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (29, N'Мониторинг ресурсов, EventLog', N'', N'', 4, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (30, N'Профилирование и декомпиляция', N'', N'', 4, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (31, N'IDE', N'ChormeDevTool, Visual Studio, Resharper', N'', 4, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (32, N'Resharper и хоткеи', N'', N'', 4, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (33, N'LDAP', N'', N'', 4, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (34, N'wiki - confluence', N'', N'', 5, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (35, N'tfs', N'', N'', 5, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (36, N'git', N'', N'', 5, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (37, N'таймшиты и gtag', N'', N'', 5, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (38, N'SonarQube', N'', N'', 5, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (39, N'Паттерны enterprise разработки', N'', N'', 6, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (40, N'Степень самостоятельности', N'Степень самостоятельности, которую проявляет сотрудник', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (41, N'Зона ответственности в рамках проекта', N'Зона ответственности, которую сотрудник брал на себя в рамках предыдущих проектов в компании	', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (42, N'Декомпозиция сложных задач', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (43, N'Руководство группой разработки', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (44, N'Оценка со стороны Project Manager''а', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (45, N'Соблюдение стандартов разработки', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (46, N'Знание процесс разработки	', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (47, N'Опыт работы (лет)', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (48, N'Знание английского', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (49, N'Количество необязательных компетенций', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (50, N'Выступления с докладом', N'', N'', 7, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (51, N'Стили и разметка', N'css / scss, азы html-верстки, анимация', N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (52, N'JS / TS', N'Работа с javascript и typescript - к чистому коду может привести только корректное обмазывание синтаксическим сахаром (и соблюдение SOLID, конечно).', N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (53, N'DevExtreme', N'', N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (54, N'Angular - ui', N'', N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (55, N'Angular - modules, DI, packing', N'', N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (56, N'Angular - ui', N'',  N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (57, N'SystemJS', N'Загрузчик и компоновщик js-модулей.', N'', 8, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (58, N'Паттерны проектирования систем', NULL,  N'', 6, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (59, N'MQ', N'технологии Message Queue ',  NULL, 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (60, N'MQ', NULL, NULL, 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (61, N'CQRS и EventSourcing', NULL, NULL, 3, true);
INSERT INTO kaizen.skill.skills (id, name, short_description, description, category_id, is_active) VALUES (62, N'Управление разработкой', NULL,  NULL, 3, true);

INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (1, N'Stream уровень 1', N'Как пользоваться классом Stream, чем может отличаться от обычного взаимодействия с переменными в памяти.;
FileStream - как работать, какие есть особенности?', true, N'<h1>Примеры вопросов:</h1>

<ol>
	<li>Что такое поток (Stream) в разработке? Чему служит абстрактная концепция потока?</li>;
	<li>В чем отличия между работой с потоком данных и работой с данными в виде структуры данных в переменных</li>
	<li>Перечислите ключевые требования к коду, который работает с потоками (при условии, что мы обязались не разрушать абстракцию Stream и не знаем точно, с чем мы работаем). Что из перечисленного вы считаете проблемным?</li>;
	<li>Один из наиболее часто используемых представителей семейства потоков - FileStrem - имеет ряд особенностей, которые на него накладывает необходимость работы с файловой системой. Перечислите те, которые помните.</li>
	<li>StreamReader, StringReader, TextReader - какая между ними разница, кто за что отвечает? Как они связаны с потоками?</li>
	<li>Может ли поток быть бесконечным?</li>
	<li>В каких случаях стоит использовать потоки, а в каких - постараться обходиться без них?</li>
</ol>

<h1>​Практика</h1>

<p>Постройте консольное приложение, которое будет читать файл любого размера в UTF-8 кодировке и выводить в консоль количество слов &quot;Start&quot;.</p>

<h1>Полезное чтиво</h1>

<p><a href="https://msdn.microsoft.com/en-us/library/system.io.stream(v=vs.85).aspx" target="">https://msdn.microsoft.com/en-us/library/system.io.stream(v=vs.85).aspx</a>​</p>;

<p><a href="https://professorweb.ru/my/csharp/thread_and_files/level3/3_8.php (частичный вольный перевод MSDN)" target="">https://professorweb.ru/my/csharp/thread_and_files/level3/3_8.php (частичный вольный перевод MSDN)</a>​</p>;

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.io.filestream(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.io.filestream(v=vs.110).aspx</a>​</p>;

<p><a href="https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx" target="">https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx</a>​</p>;

<p><a href="https://stackoverflow.com/questions/4699895/how-to-deal-with-the-position-in-a-c-sharp-stream" target="">https://stackoverflow.com/questions/4699895/how-to-deal-with-the-position-in-a-c-sharp-stream</a></p>

<p>​</p>
', 12, 1);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (2, N'Stream уровень 2', N'Какие есть особые Stream в BCL (NetworkStream,GZipStream)?;
В каких случаях стоит создавать свой класс потоков или кастомизировать существующий?', true, N'<h3>Примеры вопросов:</h3><ol style="font-size: 14px;"><li>Какие вы знаете полезные классы потоков в .NET?</li><li>Чем особенным отличается сетевой поток (NetworkStream) от своих более простых соседей (MemoryStream, FileStream)? Какие действия с ним невозможно производить, какие особенности диктует уровень железа (веб-сокет)?</li><li>В каких случаях допустимо использовать потоки в качестве API? Какие моменты Вы бы стали уточнять в своей документации по API, которое использует поток на вход и выход, а какие - нет? (стоит помнить, что времени на документацию API всегда мало, так что описать все детали реализации в API не только неправильно, но еще и некогда)</li></ol><h3>​Практика</h3><p>Создайте консольное приложение, которое будет скачивать файл любого размера, разархивировать его и выводить в консоль содержимое в виде текста в кодировке UTF-8, не сохраняя на жестком диске.</p><h3>Полезное чтиво</h3><p><a href="https://stackoverflow.com/questions/12316285/what-is-the-difference-between-c-sharp-network-stream-and-memory-stream-in-conte" target="">https://stackoverflow.com/questions/12316285/what-is-the-difference-between-c-sharp-network-stream-and-memory-stream-in-conte</a></p><p><a href="https://docs.microsoft.com/ru-ru/dotnet/framework/network-programming/using-streams-on-the-network" target="">https://docs.microsoft.com/ru-ru/dotnet/framework/network-programming/using-streams-on-the-network</a>​</p><h3>​Углубленные моменты</h3><p>TCP/IP Sockets in C# - Practical Guide for Programmers - раздел 3.2 Composing I/O Streams<br/>Можно найти в \\srv-share\Public\Developers\Books</p><p><br/></p><p></p><p></p><p></p>', 20, 1);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (3, N'Reflection/Expression', N'Понимание того, что можно получить метаданные о типе, его методах, свойствах, атрибутах. Атрибуты и как они работают. простой пример',  true, N'', 0, 2);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (4, N'Reflection/Expression уровень 1', N'Понимание атрибутов',  true, N'<h3>Рекомендуемые вопросы:</h3>;

<ol>
	<li>​Чем является атрибут относительно C#?</li>
	<li>Назовите примеры используемых в .Net Framework и иных библиотеках атрибутов.</li>
</ol>

<h3>Практика:</h3>

<p>Создать библиотеку с helper-методом, который получает объект и возвращает количество [DisplayAttribute] на классе переданного объекта.</p>

<h3>Полезное чтиво</h3>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/attributes/accessing-attributes-by-using-reflection" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/attributes/accessing-attributes-by-using-reflection</a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 8, 2);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (5, N'Reflection/Expression уровень 2', N'Понимание того, что можно получить метаданные о типе, его методах, свойствах, атрибутах. Атрибуты и как они работают. простой примеразовые знания;

Понимание механизмов, стоящих за рефлексией, базовое понимание expression.',  true, N'<h2>Рекомендуемые вопросы:</h2>

<ol>
	<li>Каким образом Reflection получает информацию о методах и свойствах?</li>
	<li>Какие данные доступны через Reflection? Попробуйте перечислить все, что помните.</li>
	<li>Чем отличается Reflection от dynamic?</li>
	<li>ЧТо такое Expression?</li>
</ol>

<h2>Практика:</h2>

<p>Написать консольное приложение, которое получает как аргумент путь к .Net сборке (Assembly-файл) и отображает количество свойств &quot;FuBarBarz&quot; у всех классов, находящихся непосредственно в сборе, после чего вызывает статический метод &quot;Fu&quot; класса &quot;Bar&quot; из пространства имен &quot;FuBar&quot;</p>;

<h2>Полезное чтиво</h2>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/attributes/index" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/attributes/index</a>​</p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/attributes/creating-custom-attributes" style="background-color: transparent;" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/attributes/creating-custom-attributes</a>​</p>

<p>Герберт Шилдт. C#4.0: Полное руководство - Глава 17,&nbsp;</p>

<p>можно найти в&nbsp;\\srv-share\Public\Developers\Books</p>
', 10, 2);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (6, N'Reflection/Expression уровень 3 - to delete', N'Использование Expression и рефлексии - умение создавать утилитарные методы и проводить judjement call по поводу их уместности, общее понимание ресурсных затрат при исопльзовании рефлексии разными способами.	', false, N'<h1 style="font-size: 36px;">Примеры вопросов:</h1><ol style="font-size: 14px;"><li>Что такое Expression и деревья выражений? Чем отличается Expression&lt;Func&lt;T&gt;&gt; от Func&lt;T&gt;? В каких случаях стоит использовать первое, а в каких - второе?</li><li>Какие элменты может в себя включать Expression?</li><li>Каким образом в известных Вам библиотеках используются Expression?</li><li>Что является более предпочтительным - использование Reflection или Expression tree? Объясните, почему.</li><li>Каким образом Reflection получает информацию о методах и свойствах?</li></ol><h1 style="font-size: 36px;">​Практика</h1><p style="font-size: 14px;">Написать библиотеку, которая будет маппить свойства одного класса на другой (упрощенный аналог automapper).</p><h1 style="font-size: 36px;">Полезное чтиво</h1><p style="font-size: 14px;"><a href="https://msdn.microsoft.com/ru-ru/library/system.linq.expressions.expression(v=vs.110).aspx" target="" style="background-color: transparent;">https://msdn.microsoft.com/ru-ru/library/system.linq.expressions.expression(v=vs.110).aspx</a>​</p><p style="font-size: 14px;"><a href="http://mattwarren.org/2016/12/14/Why-is-Reflection-slow/" target="" style="background-color: transparent;">http://mattwarren.org/2016/12/14/Why-is-Reflection-slow/</a></p><div style="font-size: 14px;"><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/expression-trees/how-to-modify-expression-trees" target="" style="background-color: transparent;">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/expression-trees/how-to-modify-expression-trees</a><br/></div><!--EndFragment--><p><br/></p><p><br/></p>', 0, 2);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (7, N'Reflection/Expression уровень 3', N'Использование Expression и рефлексии - умение создавать утилитарные методы и проводить judjement call по поводу их уместности, общее понимание ресурсных затрат при исопльзовании рефлексии разными способами.	',  true, N'<h1>Примеры вопросов:</h1>;

<ol>
	<li>Что такое Expression и деревья выражений? Чем отличается Expression&lt;Func&lt;T&gt;&gt; от Func&lt;T&gt;? В каких случаях стоит использовать первое, а в каких - второе?</li>
	<li>Чем отличается Expression от лямбды?</li>
	<li>Какие элменты может в себя включать Expression?</li>
	<li>Каким образом в известных Вам библиотеках используются Expression?</li>
	<li>Что является более предпочтительным - использование Reflection или Expression tree? Объясните, почему.</li>
</ol>

<h1>​Практика</h1>

<p>Написать библиотеку, которая будет маппить свойства одного класса на другой (упрощенный аналог automapper).</p>;

<h1>Полезное чтиво</h1>

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.linq.expressions.expression(v=vs.110).aspx" style="background-color: transparent;" target="">https://msdn.microsoft.com/ru-ru/library/system.linq.expressions.expression(v=vs.110).aspx</a>​</p>;

<p><a href="http://mattwarren.org/2016/12/14/Why-is-Reflection-slow/" style="background-color: transparent;" target="">http://mattwarren.org/2016/12/14/Why-is-Reflection-slow/</a></p>

<div style="font-size: 14px;"><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/expression-trees/how-to-modify-expression-trees" style="background-color: transparent;" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/expression-trees/how-to-modify-expression-trees</a></div>
', 17, 2);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (8, N'Синтаксис и спецификация C# Уровень 1', N'Reference/value types, как работают Exception, их синтаксис, IDisposable и правильная имплементация;

Regexp',  true, N'<h3>Рекомендуемые вопросы:</h3>

<ol>
	<li>Что такое Reference и Value типы?</li>
	<li>Какие есть особенности поведения Reference и Value типов?</li>
	<li>out / ref keywords</li>
	<li>Зачем существует IDisposable интерфейс и using ключевое слово? Во что раскрывается using?</li>
	<li>Как и ради чего можно создать свой собственный класс Exception? Чем он будет отличаться от иных Exception&#39;ов (определенных в сборках M$)</li>;
</ol>

<h3>Полезное чтиво</h3>

<p><a href="http://jonskeet.uk/csharp/references.html" target="">http://jonskeet.uk/csharp/references.html</a></p>

<p><a href="https://stackoverflow.com/questions/23498095/reference-types-as-parameters" target="">https://stackoverflow.com/questions/23498095/reference-types-as-parameters</a>​</p>

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.idisposable(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.idisposable(v=vs.110).aspx</a></p>;

<p><a href="https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/implementing-dispose" target="">https://docs.microsoft.com/en-us/dotnet/standard/garbage-collection/implementing-dispose</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/keywords/ref" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/keywords/ref</a>​</p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/keywords/out-parameter-modifier" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/keywords/out-parameter-modifier</a>​</p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/standard/base-types/regular-expressions" target="">https://docs.microsoft.com/ru-ru/dotnet/standard/base-types/regular-expressions</a>​<br />
<!--StartFragment--><span style="font-size:14px">Герберт Шилдт. C#4.0: Полное руководство - </span>Использование модификаторов параметров ref и out<br />
<!--StartFragment--></p>

<p>Герберт Шилдт. C#4.0: Полное руководство - Глава 13,&nbsp;можно найти в&nbsp;\\srv-share\Public\Developers\Books</p>

<p>&nbsp;</p>
', 12, 3);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (9, N'Синтаксис и спецификация C# Уровень 2', N'Generic, dynamic и нижележащие классы, общее понимание Interop, значения по умолчанию - как работают. Анонимные типы и Closure	',  true, N'<h3>Рекомендуемые вопросы:</h3>;

<ol>
	<li>Как работают generic классы в .net? В каких случаях (и в какой момент) возможно использовать данные фактического класса, который используется для вызова generic&#39;а?</li>;
	<li>Какие доступны ограничители (constraints) на generic-классы? В чем это помогает? Какие есть особенности использования - последовательности объявления constraint&#39;ов?</li>;
	<li>Возможно ли объявить generic-интерфейс? generic-метод? В чем разница между generic-методом и generic-классом?</li>
	<li>Что такое dynamic? как он работает? Каким образом можно добавить логики в работу dynamic-класса? (ExpandoObject, DynamicObject)</li>;
	<li>Что такое Interop? Каким образом можно организовывать взаимодействие с другими библиотеками через interop?</li>
	<li>Во что раскрывает компилятор анонимные типы? Какие ограничения анонимные типы накладывают на код?</li>
	<li>Во что раскрывает компилятор использование Closure (замыканий)?</li>;
	<li>Что такое ко-вариантность и контр-вариантность?</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/generics/generics-in-the-run-time" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/generics/generics-in-the-run-time</a></p>

<div><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/types/using-type-dynamic" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/types/using-type-dynamic</a>

<div>&nbsp;</div>

<div><a href="https://stackoverflow.com/questions/16264289/captured-closure-loop-variable-in-c-sharp-5-0" target="">https://stackoverflow.com/questions/16264289/captured-closure-loop-variable-in-c-sharp-5-0</a></div>

<div><a href="https://msdn.microsoft.com/ru-ru/library/55d3thsc.aspx" target="">https://msdn.microsoft.com/ru-ru/library/55d3thsc.aspx</a></div>

<div><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/interop/how-to-access-office-onterop-objects" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/interop/how-to-access-office-onterop-objects</a></div>

<div><a href="http://csharpindepth.com/Articles/Chapter5/Closures.aspx" target="">http://csharpindepth.com/Articles/Chapter5/Closures.aspx</a></div>

<div><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/covariance-contravariance/" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/covariance-contravariance/</a><br />
<br />
<!--StartFragment-->
<p>Герберт Шилдт. C#4.0: Полное руководство - Глава 18 Обобщения,&nbsp;</p>

<p>можно найти в&nbsp;\\srv-share\Public\Developers\Books</p>
</div>
</div>
', 22, 3);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (10, N'System.Collections/LINQ уровень 1', N'Array, List, ReadonlyCollection, Dictionary, Set;

LINQ - наиболее часто используемые методы, поверхностное понимание их работы',  true, N'<h3>Рекомендуемые вопросы:</h3>

<ol>
	<li>Какие есть обобщенные классы коллекций в BCL .NET Framework</li>
	<li>Что позволяет инициализировать коллекцию в рамках одного выражения (перечислив члены колекции в { } )</li>;
	<li>Какая разница между Readonly коллекциями и обычными аналогами?</li>
	<li>Какие наиболее полезные методы LINQ Вы можете назвать? В чем разница между обычными методами и deferred execution, которое работает в некоторых методах в рамках LINQ?</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://coding.abel.nu/2011/12/return-ienumerable-with-yield-return/​" target="">https://coding.abel.nu/2011/12/return-ienumerable-with-yield-return/​</a>​</p>

<p><a href="https://msdn.microsoft.com/en-us/library/gg509017.aspx" target="">https://msdn.microsoft.com/en-us/library/gg509017.aspx</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/collections" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/collections</a>​</p>
', 8, 4);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (11, N'System.Collections/LINQ уровень 2', N'IEnumerable, yield return, yield break	;
Понимание механизмов, стоящих за LINQ, владние extension methods
Понимание (поверхностное) IQueriable',  true, N'<h3>Рекомендуемые вопросы:</h3>;

<ol>
	<li>Какие механизмы были созданы для работы LINQ?</li>
	<li>Что такое Enumerator?</li>
	<li>Что такое extension method? Как его можно создать? Какие он накладывает ограничения на код, который может быть в нем использован?</li>
	<li>Что такое&nbsp;yield return, yield break?</li>
	<li>Как работает foreach в .NET?</li>
	<li>За что отвечает интерфейс&nbsp;IQueriable? Что он позволяет делать? Какие ключевые части есть у данного механизма?</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://coding.abel.nu/2011/12/return-ienumerable-with-yield-return/" target="">https://coding.abel.nu/2011/12/return-ienumerable-with-yield-return/</a>​</p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/keywords/foreach-in" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/keywords/foreach-in</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/classes-and-structs/extension-methods" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/classes-and-structs/extension-methods</a>​</p>

<p>C# in Depth Third Edition Jon Skeet - ЧастьІІІ. С#3: революционные изменения в доступе к данным</p>

<p>можно найти в&nbsp;\\srv-share\Public\Developers\Books</p>
', 16, 4);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (12, N'System.Collections/LINQ уровень 3 - to delete', N'', false, N'', 0, 4);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (13, N'System.Collections/LINQ уровень 3 - to delete', N'Collections.Concurrent', false, N'<p><br/></p><h3 style="font-size: 24px;">Рекомендуемые вопросы:</h3><ol style="font-size: 14px;"><li>В каких случаях стоит использовать конкурентные коллекции?<br/></li><li>В чем особенность работы классов находящихся в System.Collections.Concurrent?</li><li>Какие плюсы и минусы вы можете назвать в использовании конкурентных коллекций? Почему не использовать их повсеместно?</li><li>Что такое иммутабельность и в чем она помогает при работе с многопоточностью и коллекциями?</li></ol><h3 style="font-size: 24px;">Полезное чтиво<br/></h3><p style="font-size: 14px;"><a href="https://msdn.microsoft.com/en-us/library/gg509017.aspx" target="" style="background-color: transparent;">https://msdn.microsoft.com/en-us/library/gg509017.aspx</a><br/></p><p style="font-size: 14px;"><a href="https://docs.microsoft.com/ru-ru/dotnet/standard/collections/thread-safe/when-to-use-a-thread-safe-collection" target="" style="background-color: transparent;">https://docs.microsoft.com/ru-ru/dotnet/standard/collections/thread-safe/when-to-use-a-thread-safe-collection</a>​</p><p style="font-size: 14px;"><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/collections" target="" style="background-color: transparent;">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/collections</a>​</p><p style="font-size: 14px;"><a href="https://stackoverflow.com/questions/6139308/locking-an-object-to-prevent-any-data-changes" target="" style="background-color: transparent;">https://stackoverflow.com/questions/6139308/locking-an-object-to-prevent-any-data-changes</a></p><!--EndFragment--><p><br/></p><p><br/></p>', 0, 4);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (14, N'System.Collections/LINQ уровень 3', N'Collections.Concurrent;
Знание технолгий и механизмов, стоящих за IQueriable, возможность их имплементировать',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>

<ol>
	<li>В каких случаях стоит использовать конкурентные коллекции?</li>
	<li>В чем особенность работы классов находящихся в System.Collections.Concurrent?</li>
	<li>Какие плюсы и минусы вы можете назвать в использовании конкурентных коллекций? Почему не использовать их повсеместно?</li>
	<li>Что такое иммутабельность и в чем она помогает при работе с многопоточностью и коллекциями?</li>
	<li>Как работает&nbsp;IQueriable? Какие механизмы для модификации поведения Query существуют в .NET Framework?</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://msdn.microsoft.com/en-us/library/gg509017.aspx" style="background-color: transparent;" target="">https://msdn.microsoft.com/en-us/library/gg509017.aspx</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/standard/collections/thread-safe/when-to-use-a-thread-safe-collection" style="background-color: transparent;" target="">https://docs.microsoft.com/ru-ru/dotnet/standard/collections/thread-safe/when-to-use-a-thread-safe-collection</a>​</p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/collections" style="background-color: transparent;" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/collections</a>​</p>

<p><a href="https://stackoverflow.com/questions/6139308/locking-an-object-to-prevent-any-data-changes" style="background-color: transparent;" target="">https://stackoverflow.com/questions/6139308/locking-an-object-to-prevent-any-data-changes</a></p>
<!--EndFragment-->

<p><a href="https://habr.com/post/256821/" target="">https://habr.com/post/256821/</a>​</p>

<p>&nbsp;</p>
', 20, 4);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (15, N'Работа с XML в коде уровень 1', N'LINQ to XML работа',  true, N'<h2>Рекомендуемые вопросы:</h2>;

<ol>
	<li>В чем преимущество работы linq to xml по сравнению с XmlElement?</li>
</ol>

<h2>Практика</h2>

<p>Создайте консольное приложение, которое генерирует xml файл следующего формата:</p>

<p><br />
<br />
<!--StartFragment--><span style="font-size:14px">В сети (network) есть 5 компьютеров (computer) и 10 принтеров (printer)&nbsp;</span><br />;
<span style="font-size:14px">2 принтера имеют марку (model) &quot;Canon PIXMA iP2840&quot;, остальные - &quot;HP DeskJet Ink &quot;Advantage&quot; 1115&quot;.</span><br />;
<span style="font-size:14px">3 компьютера это персональные компьютеры, у них есть по одному процессору &quot;Core i5 6400&quot;</span><br />
<span style="font-size:14px">2 компьютера это сервера и у них есть по 2 процессора &quot;AMD &lt;OPTERON&gt; 8431&quot;</span><br />
<br />
<span style="font-size:14px">У каждого элемента сети есть уникальное имя, представляющее собой порядковый номер.</span><!--EndFragment--><br />
&nbsp;</p>

<h2>Полезное чтиво</h2>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/linq/linq-to-xml-overview" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/programming-guide/concepts/linq/linq-to-xml-overview</a>​</p>

<p>﻿</p>
', 4, 5);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (16, N'Работа с XML в коде уровень 2', N'XmlDocument работа, понимание SaX	',  true, N'<h3>Рекомендуемые вопросы:</h3>;

<ol>
	<li>Что может служить источником данных для XmlReader?</li>
	<li>В каких случаях требуется использовать XmlReader? Какие ограничения накладывает его использование при парсинге xml?</li>
	<li>Каким образом можно организовать валидацию документа через XmlReader?</li>
	<li>В чем разница между моделью SaX и XmlReader?</li>
</ol>

<h3>Практика</h3>

<p>Создать консольное приложение, которое принимает как аргумент путь к XML-файлу в UTF-8 формате любого размера и считывает его содержимое. После прочтения приложение должно вывести количество атрибутов &quot;FuBar&quot; в документе.</p>

<h3>Полезное чтиво</h3>

<p><a href="https://msdn.microsoft.com/ru-ru/library/sbw89de7(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/sbw89de7(v=vs.110).aspx</a>​</p>;
<!--EndFragment-->

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.xml.xmlreader(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.xml.xmlreader(v=vs.110).aspx</a>​</p>;

<p><a href="https://msdn.microsoft.com/en-us/library/ms950765.aspx" target="">https://msdn.microsoft.com/en-us/library/ms950765.aspx</a>​</p>
', 12, 5);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (17, N'Работа с XML в коде уровень 3', N'SaX parsing',  true, N'<h3>Рекомендуемые вопросы:</h3>;

<ol>
	<li>Что такое SaX парсер? Чем он отличается от обычных, доступных в .NET Framework функций работы с XML?</li>
	<li>Опишите сценарии, в которых SaX парсер удобнее или уместнее стандартных подходов.</li>
</ol>

<h3>Практика</h3>

<p>.Найдите или создайте реализацию SaX парсера, объясните механизмы его работы и способы дальнейшей модификации под расширенные сценарии.</p>

<h3>Полезное чтиво</h3>

<p><a href="https://ru.wikipedia.org/wiki/SAX">https://ru.wikipedia.org/wiki/SAX</a></p>

<p><a href="https://docs.oracle.com/cd/E19879-01/819-3669/bnbdy/index.html">https://docs.oracle.com/cd/E19879-01/819-3669/bnbdy/index.html</a></p>
', 6, 5);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (18, N'Многопоточность уровень 1', N'Tasks, Thread, их использование, контекст исполнения, чем отличаются,;

Наиболее популярные методы - Task.Delay и т.п.',  true, N'<h3>Рекомендуемые вопросы:</h3>

<ol>
	<li>Что такое поток исполнения? (Thread)</li>;
	<li>Чем Thread отличается от Task? Объясните своими словами.</li>
	<li>Что такое контекст исполнения задачи (Task)?</li>;
	<li>В каких случаях уместно использование Task?</li>
</ol>

<h3>Практика</h3>

<p>Создайте консольное приложение, которое получает предоставляет возможность ввести пути к файлам (по очереди) и приоритеты для файлов, после чего параллельно выводит содержимое файлов построчно и с учетом выданного приоритета потока. При нажатии на любую кнопку после начала вывода программа должна закрываться.</p>;

<h3>Полезное чтиво</h3>

<p><a href="https://docs.microsoft.com/ru-Ru/dotnet/standard/parallel-programming/task-based-asynchronous-programming" target="">https://docs.microsoft.com/ru-Ru/dotnet/standard/parallel-programming/task-based-asynchronous-programming</a>​</p>
', 14, 6);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (19, N'Многопоточность уровень 2', N'lock - варианты использования;

ExecutionContext,

async await - как работает, ConfigureAwait

TPL, ThreadPool, WPF Dispatcher
',  true, N'<h3>Рекомендуемые вопросы:</h3>

<ol>
	<li>Что такое lock? Во что превращает lock компилятор c#?</li>
	<li>Во что превращает async-await компилятор? Как работает async-await с контекстом синхронизации по умолчанию? Как на это влияет ConfigureAwait?</li>
	<li>Что такое ThreadPool? Чем исполнение задачи через создание Task отличается от запуска задачи череез ThreadPool? А запуск Thread без ThreadPool?</li>
	<li>В чем особенность работы потоков WinForm и WPF? Какую роль в этом выполняет диспатчер? В чем отличие Send от Post?</li>
	<li>Какие есть SyncronizationContext?</li>
</ol>

<h3>Практика</h3>

<p>Создайте консольное приложение, которое получает предоставляет возможность ввести пути к файлам (по очереди) и приоритеты для файлов, после чего параллельно выводит содержимое файлов построчно и с учетом выданного приоритета потока. При нажатии на любую кнопку после начала вывода программа должна закрываться <strong>И высвобождать все файлы</strong>.</p>;

<h3>Полезное чтиво</h3>

<p><a href="https://habr.com/post/232169/" target="">https://habr.com/post/232169/</a>​</p>

<p><a href="https://msdn.microsoft.com/ru-ru/library/hh191443(v=vs.120).aspx" target="">https://msdn.microsoft.com/ru-ru/library/hh191443(v=vs.120).aspx</a>​</p>;

<p><a href="https://weblogs.asp.net/dixin/understanding-c-sharp-async-await-1-compilation" target="">https://weblogs.asp.net/dixin/understanding-c-sharp-async-await-1-compilation</a>​</p>

<p><a href="https://stackoverflow.com/questions/6029804/how-does-lock-work-exactly" target="">https://stackoverflow.com/questions/6029804/how-does-lock-work-exactly</a></p>

<p>&nbsp;</p>

<p><a href="https://msdn.microsoft.com/en-us/library/de0542zz.aspx" target="">https://msdn.microsoft.com/en-us/library/de0542zz.aspx</a>​</p>

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.threading.threadpool(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.threading.threadpool(v=vs.110).aspx</a>​</p>;
', 20, 6);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (20, N'Многопоточность уровень 3', N'Семафоры, мьютексы - как работают, зачем используются;
',  true, N'<h3>Рекомендуемые вопросы:</h3>

<ul>
	<li>Что такое семафоры? В каких сценариях уместно их использование?</li>
	<li>Что такое мьютекс?</li>
	<li>Каким образом можно обеспечить уникальность запущенного на ОС приложения?</li>
	<li>Шарятся ли мьютексы между несколькими пользователями на одной машине?</li>
	<li>Как свазаны lock и мьютексы/семафоры?</li>
	<li>Как взаимодействует модель программирования на тасках с мьютексами и семафорами?</li>
</ul>

<h3>Практика</h3>

<p>По желанию экзаменатора</p>
', 14, 6);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (21, N'Конфигурация, Ресурсы, Encoding, CultureInfо, Работа со временем уровень 1', N'Работа с ConfigurationManager, механизмы работы ресурсов - генерация инструментами, выборка корректных ресурсов',  true, N'<h3>Рекомендуемые вопросы:</h3>;

<ol>
	<li>Что из себя представляет механизм конфигурации .NET Framework (наиболее значимые части)?</li>;
	<li>Какая разница между файлами конфигурации app.config и web.config?</li>
	<li>Как защитить конфигурационные данные (пароли к API и пр.) от попадания в руки злоумышленников?</li>;
	<li>Позволяет ли конфигурация создавать кастомные блоки разметки? Если да - то каким образом? Что можно в них размещать?</li>
	<li>Как вынести часть конфигурации в отдельный файл? К каким отрицательным последствиям это приведет?</li>
	<li>Каким образом .NET Framework выбирает, какие именно ресурсы ему использовать?</li>
	<li>Что необходимо сделать, чтобы приложение было локализуемым?</li>
	<li>Как механизм ресурсов помогает локализации? Что можно локализовать при помощи него?</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://msdn.microsoft.com/ru-ru/library/s9ckwb4b(v=vs.100).aspx" target="">https://msdn.microsoft.com/ru-ru/library/s9ckwb4b(v=vs.100).aspx</a>​</p>;

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.configuration.configurationmanager(v=vs.100).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.configuration.configurationmanager(v=vs.100).aspx</a>​</p>;

<p><!--StartFragment--><a href="https://support.microsoft.com/ru-ru/help/815786/how-to-store-and-retrieve-custom-information-from-an-application-confi" style="font-size: 14px;" target="">https://support.microsoft.com/ru-ru/help/815786/how-to-store-and-retrieve-custom-information-from-an-application-confi</a><span style="font-size:14px">​</span></p>

<p><!--EndFragment--><a href="https://msdn.microsoft.com/ru-ru/library/2tw134k3.aspx" target="">https://msdn.microsoft.com/ru-ru/library/2tw134k3.aspx</a><br />
<a href="https://stackoverflow.com/questions/1075245/encrypting-web-config" target="">https://stackoverflow.com/questions/1075245/encrypting-web-config</a></p>

<p><a href="https://stackoverflow.com/questions/6940004/asp-net-web-config-configsource-vs-file-attributes" target="">https://stackoverflow.com/questions/6940004/asp-net-web-config-configsource-vs-file-attributes</a>​</p>
', 10, 7);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (22, N'Конфигурация, Ресурсы, Encoding, CultureInfо, Работа со временем уровень 2', N'CultureInfo,Таймзоны, Utc, сериализация, форматирование;

Базовый encoding для .NET кода

',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>

<ol>
	<li><span style="font-size:14px">Что такое Globalization и Localization? В чем их различия? Каким требованиям должно удовлетворять глобализуемое приложение? А локализуемое?</span></li>
	<li>Какая разница между сборками-сателлитами и вложенными ресурсами локализации? В каких случаях более уместно одно, а в каких - дргое?</li>
	<li>Как связана конфигурация в файле web.config и конфигурация IIS (расскажите в общих чертах)?</li>;
	<li>Расскажите подробнее своими словами об основных способах использования CultureInfo - форматирование, парсинг, определение используемых ресурсов, его статические методы и свойства.</li>
	<li>Каким образом указывается таймзона при передачи данных о дате и времени? На что влияет эта информация? Какие есть иные способы позаботиться о корректной передаче данных о дате и времени?</li>
	<li>Что такое UTC время и в каких случаях его рекомендуется использовать?</li>
	<li>Как encoding влияет на работу с текстовыми данными?</li>
	<li>Как работает string.format? Чем его работа отличается от интерполяции строк?</li>
	<li>Что такое интернирование строк?</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://blogs.msdn.microsoft.com/drintl/2005/06/07/orlando-day-1-sunday/" style="font-size: 14px;" target="">https://blogs.msdn.microsoft.com/drintl/2005/06/07/orlando-day-1-sunday/</a><span style="font-size:14px">​</span></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/standard/base-types/character-encoding#encodings-in-net" target="">https://docs.microsoft.com/ru-ru/dotnet/standard/base-types/character-encoding#encodings-in-net</a>​</p>

<p><a href="https://stackoverflow.com/questions/365569/what-is-a-satellite-assembly" target="">https://stackoverflow.com/questions/365569/what-is-a-satellite-assembly</a>​</p>

<p><a href="https://ru.stackoverflow.com/questions/497466/c-%D0%A7%D1%82%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B3%D0%BE-%D1%82%D0%B5%D0%BA%D1%81%D1%82%D0%B0-%D0%B8%D0%B7-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2" target="">https://ru.stackoverflow.com/questions/497466/c-%D0%A7%D1%82%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D0%B7%D0%B0%D0%BF%D0%B8%D1%81%D1%8C-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%B3%D0%BE-%D1%82%D0%B5%D0%BA%D1%81%D1%82%D0%B0-%D0%B8%D0%B7-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2</a>​</p>

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.globalization.cultureinfo(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.globalization.cultureinfo(v=vs.110).aspx</a></p>;

<p><a href="https://msdn.microsoft.com/ru-RU/library/system.datetimeoffset(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-RU/library/system.datetimeoffset(v=vs.110).aspx</a></p>;

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/tokens/interpolated" target="">https://docs.microsoft.com/ru-ru/dotnet/csharp/language-reference/tokens/interpolated</a>​</p>

<p><a href="https://msdn.microsoft.com/ru-ru/library/system.string.format(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/system.string.format(v=vs.110).aspx</a>​</p>;

<p><a href="https://msdn.microsoft.com/ru-ru/library/zdtaw1bw(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/zdtaw1bw(v=vs.110).aspx</a></p>;

<p>​<a href="https://msdn.microsoft.com/ru-ru/library/fzeeb5cd(v=vs.110).aspx" target="">https://msdn.microsoft.com/ru-ru/library/fzeeb5cd(v=vs.110).aspx</a></p>;
', 12, 7);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (23, N'ADO.NET уровень 1', N'Connection;
Transaction',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>

<ol>
	<li>Объясните своими словами, что представляет собой класс DbConnection?&nbsp; Какие механизмы взаимодействия с базой данных он нам открывает?</li>
	<li>Чем отличается работа с ADO.NET от работы с EF?&nbsp;</li>
	<li>Каким образом можно организовать работу с транзакциями используя DbConnection?</li>
</ol>
<!--EndFragment-->

<h3>Практика</h3>

<p>Напишите консольное приложение, которое получает ConnectionString (с указанием InitalCatalog) и выводит список из всех наименований столбцов. Для получения данных&nbsp;можете использовать следующим скрипт:</p>;

<p>&nbsp;</p>

<pre style="text-align:left">
<code>SELECT *
FROM INFORMATION_SCHEMA.COLUMNS</code></pre>
<!--EndFragment-->

<p>После чего выводит данные первой из выведенных колонок и создает лок на таблицу.</p>
<!--StartFragment-->

<p><span style="font-size:24px">Полезное чтиво</span></p>

<p><a href="https://msdn.microsoft.com/ru-ru/library/bh8kx08z(v=vs.100).aspx" target="">https://msdn.microsoft.com/ru-ru/library/bh8kx08z(v=vs.100).aspx</a>​</p>;

<p><a href="https://stackoverflow.com/questions/40540590/using-transaction-in-ado-net-sql" target="">https://stackoverflow.com/questions/40540590/using-transaction-in-ado-net-sql</a>​</p>

<p>&nbsp;</p>
', 8, 8);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (24, N'Сериализация и NewtonsoftJson уровень 1', N'Понимание концепции сериализации данных, умение обращаться с Newtonsoft.JSON или иным механизмом сериализации данных в json-объекты.;

',  true, N'<h2>Теория</h2>

<ul>
	<li>Примеры использования сериализации в приложениях, сериализация при перемещении между слоями приложения</li>
	<li>Сериализация в какие форматы данных возможна? В чем плюс сериализации в JSON относительно сериализации в бинарный формат? В чем минусы?</li>
	<li>Какие есть механизмы сериализации в .NET Framework? Где они применяются?</li>
</ul>

<h2 style="text-align: left;">Практика</h2>

<p style="text-align:left">Для класса, представленного ниже, организовать сериализацию в бинарный формат и в json. Создать 100 объектов данного типа и произвести одну и другую сериализацию, после чего записать результаты в соответствующие файлы.</p>

<p style="text-align:left">Какой формат занимает больше места? Почему? Какие проблемы связаны с каждым из форматов?</p>

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:870.568px">
	<tbody>
		<tr>
			<td>
			<pre>
public class PurchaseBookRecordCreateContract 
{
&nbsp;&nbsp;&nbsp;&nbsp;public List&lt;PaymentDocument&gt; PaymentDocuments { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public List&lt;DateTime&gt; GoodsRegistrationDates { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public List&lt;string&gt; SellerInfo { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string BrokerInfo { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string CustomsDeclarationNumber { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public decimal? TotalTaxOnInvoiceInRub { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public static PurchaseBookRecordCreateContract Generate(int i);
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return new PurchaseBookRecordCreateContract
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TotalTaxOnInvoiceInRub = i,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CustomsDeclarationNumber = &quot;decNum&quot; + i,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BrokerInfo = &quot;br&quot; + i,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SellerInfo = new List&lt;string&gt; {&quot;si&quot; + i},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GoodsRegistrationDates = new List&lt;DateTime&gt; {new DateTime(1990 + i, 5, 6)},;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PaymentDocuments = new List&lt;PaymentDocument&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;new PaymentDocument
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date = new DateTime(2062 + i, 1, 2),;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Number = i + &quot;num&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;}
}
public class PaymentDocument
{
&nbsp;&nbsp;&nbsp;&nbsp;public string Number { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public DateTime Date { get; set; }
}</pre>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<h2>Полезное чтиво</h2>

<p><a href="https://msdn.microsoft.com/ru-ru/library/7ay27kt9%28v=vs.120%29.aspx?f=255&amp;MSPPError=-2147217396" target="">https://msdn.microsoft.com/ru-ru/library/7ay27kt9%28v=vs.120%29.aspx?f=255&amp;MSPPError=-2147217396</a></p>
', 8, 12);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (25, N'Сериализация и NewtonsoftJson уровень 2', N'Знание возможностей кастомизации сериализации в рамках используемых приложений, а так же механизмов, которые управляют сериализацией в используемых библиотеках.',  true, N'<p style="text-align:left"><span style="font-size:24px">Теория</span></p>;

<ul>
	<li>Как можно кастомизировать стандартный способ сериализации данных (если необходима одинаковая кастомизация для целой иерархии объектов)? Есть ли дополнительные механизмы для этого&nbsp;в ASP NET MVC4.5 +? В WebApi2?</li>;
	<li>Может ли один и тот же метод WebApi возвращать и xml результат и json? Каким образом это можно организовать?</li>
	<li>Когда стоит использовать кастомизацию сериализации и десериализации через атрибуты?</li>
	<li>Как можно использовать абстрактные классы и интерфейсы бизнес-логики&nbsp;при работе с сериализацией?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Дополнить код, представленный ниже, чтобы он выводил строку, аналогичную {&#39;filename&#39;:&#39;item1&#39;,&#39;filepath&#39;:&#39;mother\correct\item1&#39;,&#39;mode&#39;:&#39;active&#39;}</li>
</ol>

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:870.568px">
	<tbody>
		<tr>
			<td>
			<pre>
&nbsp;&nbsp;&nbsp;&nbsp;class Program
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;static void Main(string[] args);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var file = new File
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FileName = &quot;item1&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IsActive = true,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ParentFolder = &quot;correct&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Root = &quot;mother&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(JsonConvert.SerializeObject(file));;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;}

&nbsp;&nbsp;&nbsp;&nbsp;public class File
&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public string FileName { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public string ParentFolder { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public string Root { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public bool IsActive { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;}</pre>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left">2. Создать ASP NET MVC приложение, контроллер которого принимает на вход (через POST) json следующего вида</p>;

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:870.568px">
	<tbody>
		<tr>
			<td>
			<pre>
{
&nbsp;&nbsp;&nbsp;&nbsp;&quot;complexObject&quot;: {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;name&quot;: &quot;Complex Object&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;description&quot;: &quot;A complex object&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;simpleObjectsArray&quot;: [
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;name&quot;: &quot;Array Object #1&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;description&quot;: &quot;The 1st array object&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;name&quot;: &quot;Array Object #2&quot;,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;description&quot;: &quot;The 2nd array object&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;],
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;scadaValues&quot;: [ 1, 2.5, 10.8 ],
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;scanType&quot;: 1
&nbsp;&nbsp;&nbsp;&nbsp;}
}</pre>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left">И преобразует его в граф строго типизированных объектов, классы которых оформлены в соответствии со стандартной конвенцией именования C#. scanType должен быть представлять собой значение из списка допустимых значений &quot;online, offline, export&quot;</p>

<h3>Полезное чтиво</h3>

<p style="text-align:left"><a href="https://docs.microsoft.com/ru-ru/aspnet/web-api/overview/formats-and-model-binding/json-and-xml-serialization" target="">https://docs.microsoft.com/ru-ru/aspnet/web-api/overview/formats-and-model-binding/json-and-xml-serialization</a>​</p>

<p style="text-align:left"><a href="https://docs.microsoft.com/en-us/aspnet/web-api/overview/formats-and-model-binding/content-negotiation" target="">https://docs.microsoft.com/en-us/aspnet/web-api/overview/formats-and-model-binding/content-negotiation</a>​</p>

<p style="text-align:left"><a href="https://www.newtonsoft.com/json/help/html/CustomJsonConverter.htm" target="">https://www.newtonsoft.com/json/help/html/CustomJsonConverter.htm</a></p>

<p style="text-align:left"><a href="https://www.newtonsoft.com/json/help/html/JsonPropertyName.htm" target="">https://www.newtonsoft.com/json/help/html/JsonPropertyName.htm</a>​</p>

<p style="text-align:left"><a href="https://stackoverflow.com/questions/11934487/custom-json-serialization-of-class" target="">https://stackoverflow.com/questions/11934487/custom-json-serialization-of-class</a></p>
', 12, 12);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (26, N'EF (уровень 1)', N'Понимание концепции ORM, назначения, знание аналогов, уровней абстракции в рамках ORM', false, N'<h1 style="font-size: 24px;text-align: left;">Общее описание</h1><p style="font-size: 14px;text-align: left;">Понимание концепции ORM, назначения, знание аналогов, уровней абстракции в рамках ORM</p><h1 style="font-size: 24px;text-align: left;">Теория</h1><ul style="font-size: 14px;text-align: left;"><li>Что такое ORM? Как к нему относится EF?</li><li>Какие классы являются базовыми для использования EF? (сущности, контекст общения с базой, трансформация запросов в SQL)</li><li>Какие глобальные подходы для работы с EF существуют?</li><li>Как создается база данных в рамках Code First? (что такое convention over configuration)</li><li>Как создать связи между таблицами при помощи FluentApi?</li></ul><h1 style="font-size: 24px;text-align: left;">Практика</h1><p style="font-size: 14px;text-align: left;">Создать приложение с CRUD-функционалом на основе EF Code first для класса следующего вида.</p><table class="wysiwyg-macro" style="width: 870.568px;font-size: 14px;text-align: left;"><tbody><tr><td class="wysiwyg-macro-body"><pre>public class Car<br/>{<br/>    public int Id { get; set; }<br/>    public string Make { get; set; }<br/>    public CarCategory Category { get; set; }<br/>}<br/><br/><br/>public class CarCategory<br/>{<br/>    public int Id { get; set; }<br/>    public string Name { get; set; }<br/>    //international code<br/>    public string Code { get; set; }<br/>}</pre></td></tr></tbody></table><!--EndFragment--><p><br/></p><p><br/></p>', 0, 13);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (27, N'Миграции уровень 1', N'Понимание концепции миграций базы данных',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Зачем нужны миграции структур баз данных?</li>
	<li>Являются ли миграции часть приложения? Где лучше хранить миграции в рамках проекта?</li>
	<li>Принципы миграций структур баз данных:
	<ul>
		<li>единоразовое выполнение каждого изменения (SQL-запроса);</li>;
		<li>строго предустановленный порядок изменений</li>
	</ul>
	Почему они необходимы? К каким плюсам приводят они в частности и использвоание миграций в целом?</li>
	<li>Что делать, если миграции привели к проблемам? В случае необходимости &quot;откатить версию продукта&quot;?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<p style="text-align:left">Создать ASP NET приложение с использованием EF Code First. При обращении к главной странице создается объект класса Car и добавляется в базу данных (модель задается по логике &quot;Model&quot; + &lt;случайное число&gt;)</p>;

<p style="text-align:left">Добавить класс Car</p>

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:886.023px">
	<tbody>
		<tr>
			<td>
			<pre>
public class Car
{
&nbsp;&nbsp;&nbsp;&nbsp;public int Id {get;set;}
&nbsp;&nbsp;&nbsp;&nbsp;public string Model{get;set;}
}</pre>
			</td>
		</tr>
	</tbody>
</table>

<p style="text-align:left">Сгенерировать EF-миграцию. Проверить, что приложение работает корректно.</p>
<!--EndFragment-->

<h3>Полезное чтиво</h3>

<p><a href="https://www.martinfowler.com/articles/evodb.html" target="">https://www.martinfowler.com/articles/evodb.html</a></p>

<p><a href="https://martinfowler.com/bliki/IncrementalMigration.html" target="">https://martinfowler.com/bliki/IncrementalMigration.html</a>​</p>

<p><a href="https://en.wikipedia.org/wiki/Schema_migration" target="">https://en.wikipedia.org/wiki/Schema_migration</a></p>
', 8, 13);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (28, N'EF уровень 1', N'Понимание концепции ORM, назначения, знание аналогов, уровней абстракции в рамках ORM',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Что такое ORM? Как к нему относится EF?</li>
	<li>Какие классы являются базовыми для использования EF? (сущности, контекст общения с базой, трансформация запросов в SQL)</li>;
	<li>Какие глобальные подходы для работы с EF существуют?</li>
	<li>Как создается база данных в рамках Code First? (что такое convention over configuration)</li>;
	<li>Как создать связи между таблицами при помощи FluentApi?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<p style="text-align:left">Создать приложение с CRUD-функционалом на основе EF Code first для класса следующего вида.</p>

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:870.568px">
	<tbody>
		<tr>
			<td>
			<pre>
public class Car
{
&nbsp;&nbsp;&nbsp;&nbsp;public int Id { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string Make { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public CarCategory Category { get; set; }
}


public class CarCategory
{
&nbsp;&nbsp;&nbsp;&nbsp;public int Id { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string Name { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;//international code
&nbsp;&nbsp;&nbsp;&nbsp;public string Code { get; set; }
}</pre>
			</td>
		</tr>
	</tbody>
</table>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 11, 13);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (29, N'EF уровень 2', N'Продвинутое использование FluentApi для привязки таблиц типа "многие ко многим", а так же для связи вне стандартной конвенции именования элементов и Foreign key, создание связей многие ко многим.;
',  true, N'<h1>Теория</h1>

<ul>
	<li>Как обозначить, что свойство на entity-классе должно быть прогинорировано при маппинге?</li>
	<li>Как обозначить свойство как уникальный самоинкрементирующийся индентификатор?</li>
	<li>Каким образом можно огранизовать маппинг многие ко многим в EF Code first? Какие у каждого из вариантов плюсы и минусы?</li>
	<li>Navigation property, Include? Какие проблемы и возможности связаны с ними?</li>
	<li>Nav property и Foreign key property - как они связаны? Каков приоритет их чтения?</li>
	<li>Миграции EF - как создать миграции, как обновить базу миграциями? Каким образом можно занести данные в базу при её создании (засидить)? Каким образом можно повлиять на поведение EF относительно структуры базы (не создавать если не существует, всегда пересоздавать базу, и т.п.)</li>;
	<li>В какой момент при создании query к базе при помощи LINQ to Entity происходит непосредственный вызов базы?</li>
	<li>Как EF отделяет клиентский код от конкретной базы данных? Что необходимо в идеальном случае для того, чтобы подключить к базе данных, отличной от MS SQL Server?</li>
	<li>Каких решений стоит избегать, а к каким прибегать чаще (базовые плохие и хорошие практики) при использовании ORM? (может примеры из опыта?)</li>;
	<li>TPH, TPC,&nbsp;TPT - в чем разница, когда использовать? Какие проблемы возникают при применении?</li>
</ul>

<h1>Практика</h1>

<ol>
	<li>
	<p style="text-align:left">Модифицировать &nbsp;решение для уровня 1 следующим образом:<br />
	Классы должны выглядеть следующим образом:</p>

	<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:1604.2px">
		<tbody>
			<tr>
				<td>
				<pre>
public class Car
{
&nbsp;&nbsp;&nbsp;&nbsp;public int Id { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string Make { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public CarCategory Category { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;//inventer or co-inventer company
&nbsp;&nbsp;&nbsp;&nbsp;public List&lt;PresenterFirm&gt; Presenter { get; set; }
}
&nbsp;
public class PresenterFirm
{
&nbsp;&nbsp;&nbsp;&nbsp;public int Id { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string Name { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public Collection&lt;Car&gt; PresentedCars { get; set; }
}
&nbsp;
public class CarCategory
{
&nbsp;&nbsp;&nbsp;&nbsp;public int Id { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;public string Name { get; set; }
&nbsp;&nbsp;&nbsp;&nbsp;//international code
&nbsp;&nbsp;&nbsp;&nbsp;public string Code { get; set; }
}</pre>
				</td>
			</tr>
		</tbody>
	</table>

	<p style="text-align:left">Создать необходимый маппинг для PresenterFirm.&nbsp;Данный класс должен содержаться в таблице с наименованием &quot;Firms&quot;.&nbsp;Конфигурация должна происходить при помощи FluentApi.&nbsp;PresenterFirm заполняется при создании базы.&nbsp;База должна пересоздаваться при каждом запуске приложения.<br />
	Создать представление, отображающее список PresenterFirm.</p>
	</li>
</ol>

<h3>Полезное чтиво</h3>

<p><a href="https://msdn.microsoft.com/en-us/library/jj591621%28v=vs.113%29.aspx?f=255&amp;MSPPError=-2147217396" target="">https://msdn.microsoft.com/en-us/library/jj591621%28v=vs.113%29.aspx?f=255&amp;MSPPError=-2147217396</a>​</p>

<p><a href="https://professorweb.ru/my/entity-framework/6/level3/3_4.php" target="">https://professorweb.ru/my/entity-framework/6/level3/3_4.php</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/framework/data/adonet/ef/writing-an-ef-data-provider" target="">https://docs.microsoft.com/ru-ru/dotnet/framework/data/adonet/ef/writing-an-ef-data-provider</a>​</p>

<p><a href="http://www.ben-morris.com/entity-framework-anti-patterns-how-not-to-use-an-orm-with-sql-server/" target="">http://www.ben-morris.com/entity-framework-anti-patterns-how-not-to-use-an-orm-with-sql-server/</a>​</p>

<p>https://blogs.msdn.microsoft.com/alexj/2009/04/14/tip-12-how-to-choose-an-inheritance-strategy/</p>

<p>https://entityframework.net/tpc</p>

<p>https://entityframework.net/tph</p>

<p>https://entityframework.net/tpt</p>
', 20, 13);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (30, N'EF уровень 3 (-)', N'Понимание процесса трансформации query к EF, работы IQueriable.;

Оптимизация запросов к EF за счет изменения уровня обращений.',  true, N'', 0, 13);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (31, N'NLog уровень 1', N'Понимание принципов работы с логами, причин использования библиотек, аналогичных NLog. Умение использовать NLog и базовые навыки его конфигурирования.',  true, N'<p style="text-align:left"><span style="font-size:24px">Теория</span></p>;

<ul>
	<li>Зачем необходимо логирование?</li>
	<li>Какие существуют уровни логирования? Какие события необходимо логировать каким уровнем?</li>
	<li>Зачем нужны уровни логирования? Как они помогают?</li>
	<li>Как устроены уровни логирования в NLog? Что такое target и rule?</li>
	<li>Какие существуют способы конфигурации логирования? Возможно ли конфигурировать логи с помощью NLog на ходу? Если да то как? Когда подобный функционал может пригодится?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Создать консольное приложение, которое обрабатывает запуски с параметрами &#39;a&#39; и &#39;b&#39;. В результате возвращается страница, на которой отображается результат сложения параметров<br />
	При запросе страницы должна происходить запись в файл &lt;папка приложения&gt;\logs\application-logs.&lt;текущая дата&gt;.log сообщения &quot;Get page&quot; уровнем info, содержащая входные параметры<br />
	Далее, в случае, если значение параметра &#39;a&#39; или &#39;b&#39; было более 100, необходимо писать в файл&nbsp;&lt;папка приложения&gt;\logs\application-logs.errors.log &nbsp;сообщение &quot;&lt;наименование переменной&gt; is too big&quot; уровнем error и выбрасывать исключение<br />
	После генерации страницы (view) необходимо писать в файл&nbsp;&lt;папка приложения&gt;\logs\application-logs.renderedViews.log сообщения &quot;Page created using &lt;результат сложения a + b&gt;&quot; уровнем trace</li>;
</ol>
<!--EndFragment-->

<h3>Полезное чтиво</h3>

<p><a href="https://github.com/NLog/NLog/wiki/Configuration-file#log-levels" target="">https://github.com/NLog/NLog/wiki/Configuration-file#log-levels</a>​</p>

<p><a href="https://github.com/NLog/NLog/wiki/Configuration-file#rules" target="">https://github.com/NLog/NLog/wiki/Configuration-file#rules</a>​</p>

<p><a href="https://softwareengineering.stackexchange.com/questions/37294/logging-why-and-what" target="">https://softwareengineering.stackexchange.com/questions/37294/logging-why-and-what</a></p>
', 7, 14);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (32, N'NLog уровень 2', N'Продвинутое владение инструментарием NLog, понимание target''ов и rule''ов в частности, и инфраструктуры библиотеки в целом. Умение подключать библиотеку в наиболее критичных местах',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Предпочтительный способ получения Logger&#39;а</li>
	<li>Какие существуют target&#39;ы для записи логов?</li>
	<li>В каких случаях стоит использовать NullTarget?</li>
	<li>В рамках приложения есть диспатчер, в рамках которого задано логирование, записывающее выполнение диспатчером каждого запрашиваемого действия. Каким образом необходимо организовать данное логирование, чтобы в случае необходимости без изменения исходного кода можно было ограничить те или иные записи в логи? (например, записи создания объектов в рамках массового импорта начинают выглядеть как проблема, и надо отказаться от их записи, чтобы иметь читаемые логи)</li>;
	<li>Layout - что это? Какие есть и варианты его оформления? Доступные в его рамках переменные</li>
	<li>Переиспользование и подключение файлов конфигурации</li>
	<li>(опционально) Как встроить логирование в asp net mvc 5 приложение для перехвата всех exception&#39;ов? Как аналогичным образом встроиться в WebApi 2?</li>;
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Создать ASP NET MVC приложение, которое записывает информацию о логах в локальную базу данных и в файл.<br />
	При запросе домашней страницы должна происходить запись в лог сообщения формата:<br />
	<br />
	<em>&lt;уровень логирования сообщения&gt; | &lt;логируемое сообщение&gt; | &lt;текущий stack trace с последними 10 фреймами&gt; | &lt;дата и время вызова&gt;</em><br />
	<br />
	Для формирования сообщения должен использоваться только функционал Layout от Nlog, но не вызывающий код.</li>
</ol>
<!--EndFragment-->

<p><span style="font-size:24px">Полезное чтиво</span></p>
<!--EndFragment-->

<p><a href="https://stackify.com/nlog-guide-dotnet-logging/" target="">https://stackify.com/nlog-guide-dotnet-logging/</a></p>

<div><a href="https://github.com/NLog/NLog/wiki/Layouts" target="">https://github.com/NLog/NLog/wiki/Layouts</a>

<div><a href="https://github.com/nlog/nlog/wiki/Layout-Renderers" target="">https://github.com/nlog/nlog/wiki/Layout-Renderers</a></div>

<div><a href="https://github.com/nlog/NLog/wiki/Configuration-file" target="">https://github.com/nlog/NLog/wiki/Configuration-file</a></div>

<div><a href="https://github.com/nlog/nlog/wiki/Filtering-log-messages" target="">https://github.com/nlog/nlog/wiki/Filtering-log-messages</a><br />
&nbsp;</div>
</div>
', 12, 14);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (33, N'NLog уровень 3', N'Механизм wrapper''ов и кастомизация NLog, продвинутое понимание архитектуры библиотеки',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Что такое wrapper, как они используются?</li>
	<li>Механизмы кастомизации NLog - как сделать кастомный target?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Создать ASP NET MVC приложения, в рамках которого организовать запись лога в базу данных с буфером записи в 10 записей и ожиданием между записью в 5 секунд. В случае переполнения очереди блокировать записи.</li>
	<li>Создать target, который бы вместо записи сообщений отправлял их по REST-api</li>
</ol>
<!--EndFragment-->

<p><span style="color:inherit; font-size:24px">Полезное чтиво</span></p>

<p><a href="https://github.com/NLog/NLog/wiki/Targets-and-Wrappers" target="">https://github.com/NLog/NLog/wiki/Targets-and-Wrappers</a></p>

<p><a href="https://github.com/NLog/NLog/wiki/How-to-write-a-custom-target" target="">https://github.com/NLog/NLog/wiki/How-to-write-a-custom-target</a></p>

<p><a href="https://github.com/NLog/NLog/wiki/How-to-write-a-custom-layout-renderer" target="">https://github.com/NLog/NLog/wiki/How-to-write-a-custom-layout-renderer</a>​</p>
', 18, 14);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (34, N'DI уровень 1', N'Знание синтаксиса Use-For-Add, когда применять, как работают Регистрый и Include. Дебаг - WhatDoIHave WhatDidIScan;
',  true, N'<h2 style="text-align: left;"><span style="font-size:24px">Теория</span></h2>

<ul>
	<li>Что такое DI-контейнер? Каким задачам он служит?</li>
	<li>Что такое RRR паттерн?</li>
	<li>Какие есть способы регистрации зависимостей? Каков их синтаксис?</li>
	<li>Что делать, если конфигурация приложения включает в себя очень-очень много классив?</li>
	<li>Каким образом можно дебажить DI на примере SM?</li>
</ul>

<p><!--EndFragment--></p>

<h2>Полезное чтиво</h2>

<p>Dependency Injection in .NET -&nbsp;<a href="https://www.ozon.ru/person/22105014/" onclick="s_objectID=&quot;https://www.ozon.ru/person/22105014/_1&quot;;return this.s_oc?this.s_oc(e):true">Марк Симан</a>&nbsp;(можно найти на локальном сервере в \\srv-share\Public\Developers\Books)</p>;

<p><a href="http://structuremap.github.io/diagnostics/whatdoihave/">http://structuremap.github.io/diagnostics/whatdoihave/</a></p>

<p><a href="http://structuremap.github.io/registration/registry-dsl/">http://structuremap.github.io/registration/registry-dsl/</a></p>
', 16, 15);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (35, N'DI уровень 2', N'Для StructureMap:;

.Use(FactoryMethod) .Ctor .DecorateAllWith',  true, N'<h2 style="text-align:left"><span style="font-size:24px">Теория</span></h2>;

<ol>
	<li>Как можно провести регистрацию в DI декоратора?</li>
	<li>Возможно ли регистрировать больше 1 декоратора на класс?</li>
	<li>Каким образом можно конкретизировать параметры, которые должны использоваться при вызове конструктора?&nbsp;</li>
	<li>Каким образом создаются объекты внутри DI контейнеров?</li>
	<li>Чем отличается регистрация объекта через объявление связи абстракция-имплементация от регистрации через factory-матод?</li>
	<li>Какие есть способы конфигурации DI? В чем их принципиальная разница? В каких случаях какие подходы более удачны?</li>
	<li>В чем проблема работы конвенции &quot;авторегистрация не-абстрактных классов на себя&quot;</li>
</ol>

<p><!--EndFragment--></p>

<h2>Полезное чтиво</h2>

<p><a href="http://structuremap.github.io/registration/constructor-selection/">http://structuremap.github.io/registration/constructor-selection/</a></p>

<p><a href="http://structuremap.github.io/interception-and-decorators/">http://structuremap.github.io/interception-and-decorators/</a></p>

<p>Dependency Injection in .NET -&nbsp;<a href="https://www.ozon.ru/person/22105014/" onclick="s_objectID=&quot;https://www.ozon.ru/person/22105014/_1&quot;;return this.s_oc?this.s_oc(e):true">Марк Симан</a>, глава 3 DI-контейнеры (можно найти на локальном сервере в \\srv-share\Public\Developers\Books)</p>;

<h2>Ремарки:</h2>

<p>При создании объектов через StructureMap можно передавать (опционально) explicit arguments - по сути, дополнительный контекст исполнения. Через него мы в платформе передаем Connection / Transaction и подобные вещи. Однако в виду &quot;особого поведения&quot; (багов) в SM мы имеем проблемы с некоторым стандартным функционалом, в частности - с декораторами. Декораторы, задаваемые в явном виде, не работают корректно вместе с explicit arguments на данный момент, поэтому нам приходится обходиться методом&nbsp;DecorateAllWith</p>;
', 16, 15);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (36, N'DI уровень 3', N'Instance, Configure, Policy',  true, N'<h2 style="text-align:left"><span style="font-size:24px">Теория</span></h2>;

<ol>
	<li>Что такое Lifestyle? Каким образом он влияет на жизненный цикл объектов? Каким образом работает Lifestyle с disposable-объектами?</li>
	<li>Что такое Policy? Как сформировать собственный autowire-правило?</li>
	<li>Как работает interception с DI-контейнерами?</li>
	<li>Каким образом можно создать объект по классу? Каким образом это делают контейнеры зависимостей?</li>
</ol>

<p><!--EndFragment--></p>

<h2>Полезное чтиво</h2>

<p>Dependency Injection in .NET -&nbsp;<a href="https://www.ozon.ru/person/22105014/" onclick="s_objectID=&quot;https://www.ozon.ru/person/22105014/_1&quot;;return this.s_oc?this.s_oc(e):true">Марк Симан</a>, глава 9 Мхенизм перехвата, Глава 8 Жизненный цикл объектов&nbsp; (можно найти на локальном сервере в \\srv-share\Public\Developers\Books)</p>;

<p>&nbsp;</p>
', 12, 15);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (37, N'SignalR уровень 1', N'Понимание концепции онлайн-сообщение с сервером, механизмов работы SignalR и веб-сокетов в целом. Понимание, когда стоит и когда не стоит использовать данную технологию.',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>На основе каких технологий работает SignalR? (базовое описание)</li>;
	<li>Почему не использовать эти технологии вместо SignalR?</li>
	<li>Чем ценна &quot;интерактивность&quot; SignalR? В каких случаях она уместна?</li>
	<li>Какова цена &quot;висящих&quot; соединений? В каких случаях данной технологии стоит опасаться?</li>
	<li>Как можно организовать Dependency Injection в SignalR?&nbsp;</li>
	<li>Что такое группы и как они работают?</li>
	<li>Может ли сервер сам определять момент, когда ему отправлять сообщение клиентам (без инициативы со стороны клиентов)? Как это сделать?</li>;
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Создать на основе ASP NET MVC приложения анонимный чат (имя пользователя выбирается случайно из определенного в момент создания списка).<br />;
	Историю сообщений хранить в сессии.</li>
	<li>Необходимо прикрепить данный анонимный чат к задачам в системе управления проектами (чтобы в каждой задаче был свой чат, отдельный от соседних). Что для этого необходимо сделать? Какие улучшения в готовом решении стоит сделать?</li>;
</ol>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 12, 16);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (38, N'SignalR уровень 2', N'',  true, N'<p style="text-align:left"><span style="font-size:24px">Теория</span></p>;

<ul>
	<li>Что такое группы и как они работают?</li>
	<li>Может ли сервер сам определять момент, когда ему отправлять сообщение клиентам (без инициативы со стороны клиентов)? Как это сделать?</li>;
	<li>Как можно организовать Dependency Injection в SignalR?</li>
	<li>Как кастомизировать сериализацию данных при сообщении через SignalR?&nbsp;</li>
	<li>Какие есть переопределяемые методы у класса Hub?</li>
	<li>Откуда js файл, доступный в рамках клиентской части SignalR знает о существовании хабов, которые написаны нами в C# коде?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<ul>
	<li>Необходимо прикрепить данный анонимный чат (из практики уровня 1) к задачам в системе управления проектами (чтобы в каждой задаче был свой чат, отдельный от соседних). Что для этого необходимо сделать? Какие улучшения в готовом решении стоит сделать?</li>;
</ul>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 18, 16);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (39, N'SignalR уровень 3', N'Безопасность, масштабирование, оптимизация',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Каким образом обеспечивается идентификация пользователя, с которым поддерживается соединение?</li>
	<li>Как обеспечивается переподключение пользователей?</li>
	<li>Как можно определить, какой пользователь отправил на сервер сообщение? Как увязать этого пользователя с пользователем в Microsoft.Identity?</li>
	<li>CSRF и SSL-рекомендации для SignalR</li>
	<li>Трассировка работы SignalR - как включить?</li>
	<li>Оптимизация - что делать, если необходимо отправлять большое количество уведомлений на каждого клиента, но &quot;мгновенность&quot; доставки не столь важна?</li>
	<li>Какие есть основные способы масштабирования основанных на SignalR приложений? Как можно обеспечить консистентность работы клиента и сервера.</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Создать кластер из ASP NET MVC приложений с SignalR-чатом. В чате предусмотреть комнаты. При создании комната привязывается к серверу, и все входящие в комнату пользователи должны за общением через чат обращаются только к данному серверу.</li>
</ol>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 20, 16);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (40, N'css, sccs уровень 1', N'Принципы работы css, понимание что такое компилируемые диалекты css и зачем они нужны.;

Основные стили Boostrap, идеология 12-колоночной разметки.', false, N'<h3 style="font-size: 24px;">Рекомендуемые вопросы</h3><ol><li>​Что такое css? В чем выражается &#34;каскадность&#34;?</li><li>Опишите последовательсность приоритетов каждого из способов объявления применяемых стилей для элементов разметки.</li><li>Чем полезна каскадность css? В чем заключаются ее минусы? Какие требования к написанию стилей определяют эти стили?</li><li>Опишите базовые элементы, помогающие в верстке страниц (position, margin, padding, border, top/bottom... , color, background, )</li><li>Что такое 12-колончная разметка? Зачем она нужна?</li><li>Что такое Bootstrap?</li><li>Откуда можно получить информацию о корпоративных стилях?</li></ol><h3 style="font-size: 24px;">Практика</h3><p style="font-size: 14px;"><br/></p><h3 style="font-size: 24px;">Полезное чтиво<br/></h3><p><br/></p>', 0, 17);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (41, N'css, sccs уровень 2 (-)', N'Корпоративные нормы стилизации (Ui-фреймворк EY), полезные стили Metronic	', false, N'', 0, 17);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (42, N'css, sccs уровень 3 (-)', N'Работа с scss', false, N'', 0, 17);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (43, N'Тестирование уровень 1', N'NUnit - классы для разметки, Assert''ы',  true, N'<h2 style="text-align:left"><span style="font-size:24px">Теория</span></h2>;

<ol>
	<li>Что такое юнит-тестирование? Чем оно отличается от иных видов?</li>
	<li>Какими ключевыми характеристиками должен обладать юнит-тест?</li>
	<li>Какие у NUnit есть ключевые методы для проверки утверждений в юнит-теста? Какие есть statc-классы для проверки утверждений?</li>
	<li>Каким образом Nunit понимаем, что перед ним класс с тестами?</li>
</ol>

<p><!--EndFragment--></p>

<h2>Полезное чтиво</h2>

<p><a href="https://get-testy.com/getting-started-with-nunit/">https://get-testy.com/getting-started-with-nunit/</a></p>

<p>The Art of Unit Testing -&nbsp;Roy Osherove (можно найти в \\srv-share\Public\Developers\Books) - Part 1 Getting started</p>;
', 14, 18);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (44, N'Тестирование уровень 2', N'Паттерн AAA;

Базовый синтаксис Assert

Базовый уровень знания Moq или иной фреймворк изоляции',  true, N'<h2 style="text-align:left"><span style="font-size:24px">Теория</span></h2>

<ol>
	<li>Что такое AAA паттерн в юнит-тестах?</li>
	<li>Что такое фреймворк изоляции?</li>
	<li>Каким условиям должна удовлетворять инфрастурктура тестируемого субъекта, чтобы фреймворк изоляции отработал корректно?</li>
	<li>Что такое интеграционные тесты?</li>
	<li>Дайте свое определение innercom / outercom тестам.</li>
</ol>

<p><!--EndFragment--></p>

<h2>Полезное чтиво</h2>

<p>The Art of Unit Testing -&nbsp;Roy Osherove (можно найти в \\srv-share\Public\Developers\Books) - Part 2&nbsp;Core techniques</p>;
', 14, 18);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (45, N'Тестирование уровень 3', N'Паттерны юнит-тестирования (через наследование, Fake и т.п.);

Продвинутое использование Moq',  true, N'<h2 style="text-align:left"><span style="font-size:24px">Теория</span></h2>

<ol>
	<li>Какие есть паттерны/приемы для юнит-тестирования?</li>
	<li>Опишите, как корректно определить тип теста, как корректно группировать их? Для чего используется группировка тестов?</li>
	<li>Что такое авто-тесты? Для каких задач они больше подходят?</li>
</ol>

<h2>Практика</h2>

<p>Напишите валидный авто-тест</p>

<p><!--EndFragment--></p>

<h2>Полезное чтиво</h2>

<p>The Art of Unit Testing -&nbsp;Roy Osherove (можно найти в \\srv-share\Public\Developers\Books) - Part 3/4</p>;
', 15, 18);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (46, N'Quartz уровень 1 (-)', N'Понимание работы шедулеров как паттерна',  true, N'', 0, 19);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (47, N'Quartz уровень 2 (-)', N'Понимание и умение использовать механизмы Job и Trigger;
Работа с EY.Platform.Scheduling',  true, N'', 0, 19);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (48, N'DevExtreme уровень 1 (-)', N'Datagrid,;

Editor - combobox, input, area, date,

List', false, N'', 0, 20);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (49, N'DevExtreme уровень 2 (-)', N'шаблоны для кастомизации', false, N'', 0, 20);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (50, N'XML уровень 1', N'Понимание концепции, способов использования, проблем, которые можно решить. Умение читать xml, понимание базовых правил оформления xml-документов, знание о существовании смежных технологий (xslt, xsd, xpath) и зачем они примерно нужны.',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Как расшифровывается XML?</li>
	<li>Как можно использовать&nbsp;XML? Какие есть примеры использования?</li>
	<li>Что такое XML Declaration, где он распологается, зачем он нужен?</li>
	<li>Что такое node в xml? xml element, чем он отличается от&nbsp;xml attribute?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<h3 style="text-align:left"><strong>Прочитать xml файл</strong></h3>

<ol>
	<li>Прочитать один из файлов (<a href="http://lsirwww.epfl.ch/courses/cis/2005ss/exercises/1/bank.xml">пример1</a>,&nbsp;<a href="https://msdn.microsoft.com/en-us/library/ms762271(v=vs.85).aspx">пример2</a>,&nbsp;<a href="http://www.comptechdoc.org/independent/web/xml/guide/xmlexample.html">пример3</a>,&nbsp;<a href="https://www.chilkatsoft.com/xml-samples/pigs.xml">пример4</a>) и ответить на вопросы по поводу его содержимого.&nbsp;Файл&nbsp;<u><strong>рекомендуется</strong></u><strong>&nbsp;</strong>давать не как ссылку а как&nbsp;текст.</li>;
	<li>Предположить, как можно на примере использовать xslt.</li>
</ol>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 6, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (51, N'XML уровень 2', N'Умение создавать, читать, валидировать XML. Понимание базовых гайдлайнов по работе с xml',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Что такое well formed xml?</li>
	<li>Каковы правила именования элементов и атрибутов?</li>
	<li>В каких случаях лучше использовать атрибуты, а в каких - элементы?</li>
	<li>Опишите ключевые гайдлайны по созданию xml.</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<h3 style="text-align:left"><strong>Создание xml файла под структуру объектов</strong></h3>

<p style="text-align:left">&nbsp;</p>

<ol>
	<li>Сгенерировать без помощи вспомогательных среств валидный xml, который будет представлять собой аналог следующей структуры данных:<br />
	<br />
	В сети (network) есть 5 компьютеров (computer) и 10 принтеров (printer)&nbsp;<br />;
	2 принтера имеют марку (model) &quot;Canon PIXMA iP2840&quot;, остальные - &quot;HP DeskJet Ink &quot;Advantage&quot; 1115&quot;.<br />;
	3 компьютера это персональные компьютеры, у них есть по одному процессору &quot;Core i5 6400&quot;<br />
	2 компьютера это сервера и у них есть по 2 процессора &quot;AMD &lt;OPTERON&gt; 8431&quot;<br />
	<br />
	У каждого элемента сети есть уникальное имя, представляющее собой порядковый номер.<br />
	&nbsp;</li>
	<li>Создать валидный xml, который будет представлять собой аналог следующей структуры данных:<br />
	<br />
	Есть набор из 10 валют (взять произвольные)<br />;
	У половины валют есть обменный курс в одну из валют (не представленную среди 10 взятых)<br />;
	У половины валют нет курса, но элемент, представляющий собок курс должен присутствовать пустым.</li>
</ol>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 10, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (52, N'XSD уровень 1', N'Умение читать xsd-документы и анализировать их. Понимание концепций, на которых строятся xsd-схемы, областей их применения.',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Что такое XSD?</li>
	<li>Может ли существовать файл xml без соответстующей xsd-схемы?</li>
	<li>Что дает xsd-схема при разработке? А при документации? Какую роль xsd играет при интеграции систем?&nbsp;</li>
	<li>Что такое namespace в xsd? Зачем они нужны? Что такое targetNamespace?</li>
	<li>Что такое simpleType, complexType, element в xsd? Какие существуют элементы для описания их содержимого и какие они могут накладывать правила?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<p style="text-align:left">Прочитать схему ниже и определить:</p>

<ul>
	<li>Является ли обязательным номер корректировки для документа?</li>
	<li>Какие значения может принимать идентификатор файла?</li>
	<li>Какие значения может принимать Индекс для документа?</li>
	<li>Каковы минимальное и максимальное значение для поля &quot;Порядковый номер&quot;?</li>
	<li>Какие значения может принимать поле &quot;Версия формата&quot;?</li>
</ul>

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:1644.2px">
	<tbody>
		<tr>
			<td>
			<pre>
&lt;?xml version=&quot;1.0&quot; encoding=&quot;windows-1251&quot;?&gt;
&lt;!-- edited with XMLSpy v2007 sp2 (http://www.altova.com) by VI (GNIVC FNS RF) --&gt;;
&lt;xs:schema xmlns:xs=&quot;http://www.w3.org/2001/XMLSchema&quot; xmlns:sch=&quot;http://purl.oclc.org/dsdl/schematron&quot; xmlns:usch=&quot;http://www.unisoftware.ru/schematron-extensions&quot; xmlns:sql=&quot;urn:schemas-microsoft-com:mapping-schema&quot; elementFormDefault=&quot;qualified&quot; attributeFormDefault=&quot;unqualified&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;Файл&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;Документ&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;КнигаПокуп&quot; minOccurs=&quot;0&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Сведения из книги покупок об операциях, отражаемых за истекший налоговый период&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;КнПокСтр&quot; maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;КодВидОпер&quot; maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Код вида операции&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:length value=&quot;2&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;ДокПдтвУпл&quot; minOccurs=&quot;0&quot; maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Сведения о документе, подтверждающем уплату налога&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомДокПдтвУпл&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер документа, подтверждающего уплату налога&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;256&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ДатаДокПдтвУпл&quot; type=&quot;ДатаТип&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата документа, подтверждающего уплату налога&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата в формате ДД.ММ.ГГГГ&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;ДатаУчТов&quot; type=&quot;ДатаТип&quot; minOccurs=&quot;0&quot; maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата принятия на учет товаров (работ, услуг), имущественных прав&lt;/xs:documentation&gt;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;СвПрод&quot; type=&quot;СвУчСдТип&quot; minOccurs=&quot;0&quot; maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Сведения о продавце&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;СвПос&quot; type=&quot;СвУчСдТип&quot; minOccurs=&quot;0&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Сведения о посреднике (комиссионере, агенте, экспедиторе, застройщике)&lt;/xs:documentation&gt;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомерПор&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Порядковый номер&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:integer&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;12&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minInclusive value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомСчФПрод&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;1000&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ДатаСчФПрод&quot; type=&quot;ДатаТип&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата в формате ДД.ММ.ГГГГ&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомИспрСчФ&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер исправления счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:integer&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;3&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minInclusive value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ДатаИспрСчФ&quot; type=&quot;ДатаТип&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата исправления счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата в формате ДД.ММ.ГГГГ&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомКСчФПрод&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер корректировочного счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;256&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ДатаКСчФПрод&quot; type=&quot;ДатаТип&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата корректировочного счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата в формате ДД.ММ.ГГГГ&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомИспрКСчФ&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер исправления корректировочного счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:integer&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;3&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minInclusive value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ДатаИспрКСчФ&quot; type=&quot;ДатаТип&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата исправления корректировочного счета-фактуры продавца&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Дата в формате ДД.ММ.ГГГГ&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомТД&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер таможенной декларации&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;1000&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ОКВ&quot; type=&quot;ОКВТип&quot; use=&quot;optional&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Код валюты по ОКВ&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;СтоимПокупВ&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Стоимость покупок по счету-фактуре, разница стоимости по корректировочному счету-фактуре (включая налог), в валюте счета-фактуры&lt;/xs:documentation&gt;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:decimal&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;19&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:fractionDigits value=&quot;2&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;СумНДСВыч&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Сумма налога по счету-фактуре, разница суммы налога по корректировочному счету-фактуре, принимаемая к вычету, в рублях и копейках&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:decimal&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;19&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:fractionDigits value=&quot;2&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;СумНДСВсКПк&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Сумманалога всего по книге покупок в рублях и копейках&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:decimal&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;19&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:fractionDigits value=&quot;2&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;Индекс&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Индекс&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;КНДТип&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000080&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000081&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000090&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000091&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000100&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000110&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;0000120&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;НомКорр&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Номер корректировки&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:integer&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:totalDigits value=&quot;3&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ИдФайл&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Идентификатор файла&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Содержит (повторяет) имя сформированного файла (без расширения)&lt;/xs:documentation&gt;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;100&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ВерсПрог&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Версия программы, с помощью которой сформирован файл&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;40&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;ВерсФорм&quot; use=&quot;required&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:documentation&gt;Версия формата&lt;/xs:documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:annotation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;xs:string&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minLength value=&quot;1&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxLength value=&quot;5&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:enumeration value=&quot;5.04&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:attribute&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:element&gt;
&lt;/xs:schema&gt;


</pre>
			</td>
		</tr>
	</tbody>
</table>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 13, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (53, N'XSD уровень 2', N'Умение писать сложные xsd схемы, понимание гайдлайнов по формирования xsd-схем.',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Какая разница, использовать для описания element или complexType?</li>
	<li>атрибуты elementFormDefault и attributeFormDefault - как они влияют на поведение документа?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<ol>
	<li>Создать XSD, описывающий следующую структуру:
	<ol>
		<li>В бутылке может быть сколько угодно хим. элементов (chems)</li>;
		<li>Хим. элементы имеют номера, каждый элемент - свой номер. Номера начинаются с 100.</li>
		<li>Вредоносные молекулы должны начинаться с &quot;vir_&quot;, полезные с &quot;vit_&quot;</li>
		<li>Полезные молекулы могут иметь код лицензии (license) - одно из фикисрованных значений (lic_noHarm, lic_psyGood, lic_physGood)</li>;
		<li>молекулы могут быть вложены друг в друга на неограниченную вложенность.</li>
	</ol>
	</li>
	<li>
	<p>Не прибегая к инструментам генерации создать XML, соответствующий следующей схеме:</p>

	<table class="wysiwyg-macro" style="width:1604.2px">
		<tbody>
			<tr>
				<td>
				<pre>
&lt;xs:schema xmlns:xs=&quot;http://www.w3.org/2001/XMLSchema&quot;&gt;
&nbsp;&nbsp;&lt;xs:element name=&quot;items&quot; type=&quot;ItemsType&quot;/&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;ItemsType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:choice minOccurs=&quot;0&quot; maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;hat&quot; type=&quot;ProductType&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;umbrella&quot; type=&quot;RestrictedProductType&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;shirt&quot; type=&quot;ShirtType&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:choice&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;!--Empty Content Type--&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;ItemType&quot; abstract=&quot;true&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;routingNum&quot; type=&quot;xs:integer&quot;/&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;!--Empty Content Extension (with Attribute Extension)--&gt;;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;ProductType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexContent&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:extension base=&quot;ItemType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;number&quot; type=&quot;xs:integer&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;name&quot; type=&quot;xs:string&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;description&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type=&quot;xs:string&quot; minOccurs=&quot;0&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;effDate&quot; type=&quot;xs:date&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;lang&quot; type=&quot;xs:language&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:extension&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexContent&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;!--Complex Content Restriction--&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;RestrictedProductType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexContent&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;ProductType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;number&quot; type=&quot;xs:integer&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;name&quot; type=&quot;xs:token&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:sequence&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;routingNum&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type=&quot;xs:short&quot; use=&quot;required&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;effDate&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;type=&quot;xs:date&quot; default=&quot;1900-01-01&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;lang&quot; use=&quot;prohibited&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexContent&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;!--Complex Content Extension--&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;ShirtType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:complexContent&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:extension base=&quot;RestrictedProductType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:choice maxOccurs=&quot;unbounded&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;size&quot; type=&quot;SmallSizeType&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:element name=&quot;color&quot; type=&quot;ColorType&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:choice&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;sleeve&quot; type=&quot;xs:integer&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:extension&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:complexContent&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;!--Simple Content Extension--&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;SizeType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleContent&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:extension base=&quot;xs:integer&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;system&quot; type=&quot;xs:token&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:extension&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleContent&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;!--Simple Content Restriction--&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;SmallSizeType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:simpleContent&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:restriction base=&quot;SizeType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:minInclusive value=&quot;2&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:maxInclusive value=&quot;6&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute  name=&quot;system&quot; type=&quot;xs:token&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;use=&quot;required&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:restriction&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/xs:simpleContent&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&nbsp;&nbsp;&lt;xs:complexType name=&quot;ColorType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;xs:attribute name=&quot;value&quot; type=&quot;xs:string&quot;/&gt;
&nbsp;&nbsp;&lt;/xs:complexType&gt;
&lt;/xs:schema&gt;</pre>
				</td>
			</tr>
		</tbody>
	</table>

	<p>&nbsp;</p>
	</li>
</ol>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 8, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (54, N'XSLT уровень 1', N'Понимание концепций, на основе которых строится xslt, а так же областей применения xslt-трансформаций;
', false, N'<h1 style="text-align:left">Теория</h1>
<!--StartFragment-->

<p style="text-align:left">В каких случаях уместно использование XSLT?</p>

<p style="text-align:left">Каков стандартный синтаксис для foreach, if в xslt?</p>

<p style="text-align:left">Каким образом можно заставить xslt вставлять вычисленное значение?</p>

<p style="text-align:left">Сколько шаблонов может быть в одном xslt?</p>

<p style="text-align:left">Каким образом можно запускать преобразование xslt?</p>
', 8, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (55, N'XSLT уровень 1', N'Понимание концепций, на основе которых строится xslt, а так же областей применения xslt-трансформаций;
',  true, N'<h1 style="text-align:left">Теория</h1>
<!--StartFragment-->

<p style="text-align:left">В каких случаях уместно использование XSLT?</p>

<p style="text-align:left">Каков стандартный синтаксис для foreach, if в xslt?</p>

<p style="text-align:left">Каким образом можно заставить xslt вставлять вычисленное значение?</p>

<p style="text-align:left">Сколько шаблонов может быть в одном xslt?</p>

<p style="text-align:left">Каким образом можно запускать преобразование xslt?</p>

<h1 style="text-align:left">Практика</h1>

<h3 style="text-align:left"><strong>Создание XSLT файлов</strong></h3>

<p style="text-align:left">Создать XSLT, который выводит данные&nbsp;в html формате и содержит:</p>

<ol>
	<li>Таблицу со столбцами вида</li>
</ol>

<p>&nbsp;</p>

<p>&nbsp;</p>
<!--StartFragment-->

<table class="confluenceTable wrapped" style="font-size:14px; text-align:left">
	<tbody>
		<tr>
			<th style="text-align:left; vertical-align:top"><strong>Property Id</strong></th>
			<th style="text-align:left; vertical-align:top"><strong>Property Name</strong></th>
			<th style="text-align:left; vertical-align:top"><strong>Owner Id</strong></th>
		</tr>
		<tr>
			<td style="text-align:left; vertical-align:top">ID</td>
			<td style="text-align:left; vertical-align:top">NAME</td>
			<td style="text-align:left; vertical-align:top">OWNER</td>
		</tr>
	</tbody>
</table>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<!--StartFragment-->

<p style="text-align:left">2. Плоский лист с нумерацией вида</p>

<blockquote>
<p style="text-align:left">1.&nbsp;Flat ID:&nbsp;<a href="https://wiki.eytaxtech.ru/pages/viewpage.action?pageId=23822388#flat-ID">NAME</a></p>
</blockquote>

<ol>
	<li>2. &hellip;</li>
</ol>

<p style="text-align:left">Где элемент Name это ссылка формата &quot;https:\\mysite.com\&lt;Owner id&gt;&quot;</p>

<p style="text-align:left">3. Добавить в заголовок&nbsp;css, который красит весь текст в цвет &quot;lightgray&quot;</p>

<p style="text-align:left">4. Используя xsl:if закрасьте четные строчки цветом lightblue</p>
', 11, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (56, N'XPATH уровень 1', N'Умение читать и писать xpath для html-документов.',  true, N'<p style="text-align:left"><span style="font-size:24px">Теория</span></p>;

<ul>
	<li>Что такое xpath?</li>
	<li>Зачем он нужен?</li>
	<li>Какие можно назвать основные селекторы?</li>
	<li>Какие существуют лучшие практики по построению xpath?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<p style="text-align:left">Создание XPATH для элементов html-разметки</p>

<ol>
	<li>Дана страница&nbsp;<a href="https://www.yandex.ru/">https://www.yandex.ru/</a><br />
	Необходимо создать xpath, который найдет элемент, отвечающий за погоду на завтра</li>
	<li>Дана страница&nbsp;<a href="http://www.banki.ru/">http://www.banki.ru/</a>&nbsp;<br />
	Необходимо создать xpath, который найдет элемент, содержащий наименование третьего банка в финансовом рейтинге</li>
	<li>Дана страница&nbsp;<a href="http://stackoverflow.com/">http://stackoverflow.com/</a><br />
	Необходимо создать xpath, который найдет аттрибут-ссылку на группировку вопросов по категории &quot;C#&quot;</li>
</ol>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 8, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (57, N'WSDL уровень 1', N'Понимание области использования wsdl, его синтаксиса, механизмов, которые им пользуются. ',  true, N'<h1 style="text-align:left">Теория</h1>;

<ul>
	<li>Зачем используется WSDL? Что дает использование WSDL по сравнению с её отсутствием?</li>
	<li>Какова стандартная структура wsdl, её части?</li>
	<li>Как можно переиспользовать wsdl или её части?</li>
</ul>

<h1 style="text-align:left">Практика</h1>

<p style="text-align:left">Ниже представлен пример wsdl.</p>

<p style="text-align:left">Необходимо указать:</p>

<ul>
	<li>url для соединения с сервисом</li>
	<li>сколько сервисов в схеме представлено</li>
	<li>какой характер взаимодействия методов сервисов</li>
</ul>

<table class="wysiwyg-macro" style="font-size:14px; text-align:left; width:870.568px">
	<tbody>
		<tr>
			<td>
			<pre>
&lt;definitions name=&quot;HelloService&quot;
&nbsp;&nbsp;&nbsp;targetNamespace=&quot;http://www.examples.com/wsdl/HelloService.wsdl&quot;
&nbsp;&nbsp;&nbsp;xmlns=&quot;http://schemas.xmlsoap.org/wsdl/&quot;
&nbsp;&nbsp;&nbsp;xmlns:soap=&quot;http://schemas.xmlsoap.org/wsdl/soap/&quot;
&nbsp;&nbsp;&nbsp;xmlns:tns=&quot;http://www.examples.com/wsdl/HelloService.wsdl&quot;
&nbsp;&nbsp;&nbsp;xmlns:xsd=&quot;http://www.w3.org/2001/XMLSchema&quot;&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&lt;message name=&quot;SayHelloRequest&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;part name=&quot;firstName&quot; type=&quot;xsd:string&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/message&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&lt;message name=&quot;SayHelloResponse&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;part name=&quot;greeting&quot; type=&quot;xsd:string&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/message&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&lt;portType name=&quot;Hello_PortType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;operation name=&quot;sayHello&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input message=&quot;tns:SayHelloRequest&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;output message=&quot;tns:SayHelloResponse&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/operation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/portType&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&lt;binding name=&quot;Hello_Binding&quot; type=&quot;tns:Hello_PortType&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;soap:binding style=&quot;rpc&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   transport=&quot;http://schemas.xmlsoap.org/soap/http&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;operation name=&quot;sayHello&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;soap:operation soapAction=&quot;sayHello&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;input&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;soap:body
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   encodin Style=&quot;http://schemas.xmlsoap.org/soap/encoding/&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   namespace=&quot;urn:examples:helloservice&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   use=&quot;encoded&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/input&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;output&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;soap:body
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   encodin Style=&quot;http://schemas.xmlsoap.org/soap/encoding/&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   namespace=&quot;urn:examples:helloservice&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   use=&quot;encoded&quot;/&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/output&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/operation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/binding&gt;

&nbsp;&nbsp;&nbsp;&nbsp;&lt;service name=&quot;Hello_Service&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;documentation&gt;WSDL File for HelloService&lt;/documentation&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;port binding=&quot;tns:Hello_Binding&quot; name=&quot;Hello_Port&quot;&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;soap:address
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   location=&quot;http://www.examples.com/SayHello/&quot; /&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/port&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&lt;/service&gt;
&lt;/definitions&gt;</pre>
			</td>
		</tr>
	</tbody>
</table>
<!--EndFragment-->

<p>&nbsp;</p>

<p>&nbsp;</p>
', 8, 21);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (58, N'Web Services уровень 1 (-)', N'Понимание веб-сервисов, SOA, отличие вызова приложения через веб-сервисы от иных способов исполнения кода',  true, N'', 0, 22);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (59, N'Web Services уровень 2 (-)', N'WCF - основы использования;

Знание структуры SOAP-пакетов и WSDL-дескрипторов. Умение читать и составлять типовые WSDL. Понимание концепции, умение создавать и обращаться к RESTful сервисам.',  true, N'', 0, 22);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (60, N'Web Services уровень 3 (-)', N'WebApi (контроллер, фильтры, атрибуты, сериализация);

WCF - знать кофигурирование, и механизм работы (по чему и как генерируется), использование с DI;


',  true, N'', 0, 22);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (61, N'Работы по документации уровень 1', N'Опыт работы с проектной документации',  true, N'<h2>Требуется опыт:</h2>;

<p>Заполнение ТЗ деталями по технической реализации&nbsp; - минимум 1 проект<br />
Маппинг сущностей на классы, маппинг полей на интеграционные поля, маппинг интеграционных методов - минимум 1 проект</p>
', 16, 26);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (62, N'Работы по документации уровень 2', N'Докумнтация по проектированию - опыт',  true, N'<h2>Требуется:</h2>;

<p>Ревью ТЗ по проекту и проектных предложений - минимум 1 проект.<br />
<br />
Участие в оценке проекта <span style="font-size:14px">- минимум 1 проект.</span><!--EndFragment--><br />
<br />
Участие в создании документа-дизайна системы&nbsp;&nbsp;<span style="font-size:14px">- минимум 1 проект&nbsp;</span><br />
<span style="font-size:14px">ИЛИ&nbsp;</span><!--EndFragment--><br />
<span style="font-size:14px">Участие в создании дизайна компонента системы&nbsp; - минимум 2 проекта</span><br />
<br />
<br />
<br />
&nbsp;</p>
', 20, 26);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (63, N'Работы по документации уровень 3', N'Документация по дизайн-проекту - опыт',  true, N'<h2>Требуется</h2>;

<p>Контроль оценки проекта - минимум 2 проекта.<br />
Создание и ревью архитектурной документации по проекту, создание документа-дизайна системы - минимум 1 проект.</p>
', 20, 26);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (64, N'Нотации для диаграмм уровень 1', N'Знание основных типов диаграмм, UML.',  true, N'<p>Умение читать</p>;

<ul>
	<li>Class-&nbsp;</li>
	<li>BPMN-1.0</li>
</ul>

<p>&nbsp;диграммы</p>
', 6, 27);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (65, N'Нотации для диаграмм уровень 2', N'Базовые знания',  true, N'<p>Создание простейших</p>;

<ul>
	<li>Class-,</li>
	<li>Sequence-,&nbsp;</li>
	<li>Activity-диаграмм.</li>
</ul>

<p>&nbsp;</p>

<p>Умение хорошо читать BPMN</p>

<h1>Практика</h1>

<p>Для практики создания диаграмм выбранный Вами ментор должен предоставить вам постановку задачи, по которой потребуется нарисовать соответствующие диаграммы.</p>

<p>Для практики чтения диаграмм выбранный Вами ментор должен предоставить Вам пример созданных&nbsp;диаграмм, по которым должно пройти обсуждение требований к реализации и деталей, о которых диаграммы говорят.</p>

<p>Для самого рисования можно использовать любой софт (draw.io, наш VisualParadigm, Visio, бумагу карандаш и ручку, paint...)</p>;

<h1>Чтиво</h1>

<p>The elements of UML 2.0 Style - by Scott W. Ambler (можно найти на локальном диске \\srv-share\Developers\Books)</p>;
', 8, 27);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (66, N'Нотации для диаграмм уровень 3', N'',  true, N'<p>Создание &quot;component-диаграмм&quot;</p>;

<p>Знание гайдлайнов по созданию UML диаграмм</p>

<div>Чтение простых BPMN диаграмм.</div>

<div>Чтение</div>

<ul>
	<li>Package-</li>
	<li>Deployment-</li>
	<li>State-machine-</li>
	<li>UseCase-</li>
</ul>

<div>
<p>&nbsp;</p>
</div>
', 16, 27);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (67, N'Нотации для диаграмм уровень 4', N'',  true, N'<p>Уверенное владение BPMN 2.0<br />;
<br />
Создание<br />
&nbsp;</p>

<blockquote>
<p>Package-</p>

<p>Deployment-</p>

<p>State-machine-</p>

<p>UseCase-</p>
</blockquote>

<p>диаграмм.</p>
', 12, 27);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (68, N'Работа с СУБД уровень 1', N'Простые SQL-запросы',  true, N'<h2 style="text-align:left">Теория</h2>;

<ul>
	<li>Каким образом строится шаблон запроса к SQL?</li>
	<li>Group by, having</li>
</ul>

<h2 style="text-align:left">Полезное чтиво</h2>

<p><a href="https://www.w3schools.com/sql/">https://www.w3schools.com/sql/</a></p>

<h3 style="text-align:left">&nbsp;</h3>
', 8, 28);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (69, N'Работа с СУБД уровень 2', N'ACID, уровни изоляции, commit/rollback/savepoint;

forign key, check constraint, unique constraint

collation setting',  true, N'<h2 style="text-align: left;">Теория</h2><ul><li>Что такое FK?</li><li>Как создать unique constraint? Чем он отличается от check constraint?</li><li>Что такое collation setting? На они влияют?</li><li>Опишите ACID принципы своими словами.</li><li>Как работают транзакции? Каким образом происходит управление ими?</li><li>Какие существуют уровни изоляции?</li><li>Как организуется paging запросов данных при запросах из БД?</li><li>Хранимые процедуры и триггеры - что это такое? Когда применяются, что при помощи их можно делать?</li></ul><p><br></p><h2>Практика</h2><ol><li>Воссоздайте базу данных модуля валют (Currencies) -  можно в рамках консольного приложения просто запустить запрос валют от ЦБ-РФ.</li><li>Получите при помощи одного sql-запроса все валюты, по которым в базе нет курсов.</li><li>При помощи UNION ALL и рекурсивной CTE составьте скрипт, который выгружает все пути виртуальных директорий для модуля ContentStore которые в нем содержатся, с разделителем &#39;=&gt;&#39; между именами папок.</li></ol><p><br></p><p><br></p><h2 style="text-align: left;">Полезное чтиво</h2><p><a href="https://www.w3schools.com/sql/">https://www.w3schools.com/sql/</a></p><p><a href="https://ru.wikipedia.org/wiki/ACID">https://ru.wikipedia.org/wiki/ACID</a></p><p><a href="https://docs.microsoft.com/ru-ru/sql/relational-databases/tables/unique-constraints-and-check-constraints?view=sql-server-2017">https://docs.microsoft.com/ru-ru/sql/relational-databases/tables/unique-constraints-and-check-constraints?view=sql-server-2017</a></p><p><a href="https://www.databasejournal.com/features/mssql/article.php/3302341/SQL-Server-and-Collation.htm">https://www.databasejournal.com/features/mssql/article.php/3302341/SQL-Server-and-Collation.htm</a></p><p><a href="https://docs.microsoft.com/ru-ru/sql/t-sql/statements/set-transaction-isolation-level-transact-sql?view=sql-server-2017">https://docs.microsoft.com/ru-ru/sql/t-sql/statements/set-transaction-isolation-level-transact-sql?view=sql-server-2017</a></p><p><a href="https://www.mssqltips.com/sqlservertutorial/3305/what-does-begin-tran-rollback-tran-and-commit-tran-mean/">https://www.mssqltips.com/sqlservertutorial/3305/what-does-begin-tran-rollback-tran-and-commit-tran-mean/</a></p><p><strong>Ben-Gan I. - Microsoft SQL Server 2012 T-SQL Fundamentals - Chapter 10 Programmable Objects, поверхностное понимание </strong>(\\srv-share\Developers\Books\SQL\Ben-Gan I. - Microsoft SQL Server 2012 T-SQL Fundamentals - 2012.pdf)</p><p><strong>Microsoft SQL Server 2012. Создание запросов. Учебный курс Microsoft - Глава 13 Разработка и реализация процедур T-SQL </strong>(\\srv-share\Developers\Books\SQL\Microsoft SQL Server 2012. Создание запросов. Учебный курс Microsoft (2014).pdf)</p>', 28, 28);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (70, N'Работа с СУБД уровень 3', N'index, T-SQL (базовый конструкт), хранимые процедуры.;

transaction-log, filegroup

filestream - понимание',  true, N'<h2 style="text-align:left">Теория</h2>

<ul>
	<li>
	<p>index - что такое? Как добавить индексы? На что можно добавлять индексы?</p>
	</li>
	<li>
	<p>T-SQL (базовые&nbsp;конструкты),</p>;
	</li>
	<li>
	<p>хранимые процедуры - как составляются, какие ограничения накладывают</p>
	</li>
	<li>
	<p>Что такое transaction-log, filegroup</p>
	</li>
	<li>
	<p>filestream - общее понимание</p>
	</li>
	<li>
	<p>execution plan - что такое, как используется?</p>
	</li>
</ul>

<h2 style="text-align:left">Полезное чтиво</h2>

<p><strong>Microsoft SQL Server 2012. Создание запросов. Учебный курс Microsoft - Глава 15&nbsp;Реализация индексов и статистика&nbsp;</strong>(\\srv-share\Developers\Books\SQL\Microsoft SQL Server 2012. Создание запросов. Учебный курс Microsoft (2014).pdf)</p>;

<p><a href="https://docs.microsoft.com/ru-ru/sql/relational-databases/performance/execution-plans?view=sql-server-2017">https://docs.microsoft.com/ru-ru/sql/relational-databases/performance/execution-plans?view=sql-server-2017</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/sql/relational-databases/logs/the-transaction-log-sql-server?view=sql-server-2017">https://docs.microsoft.com/ru-ru/sql/relational-databases/logs/the-transaction-log-sql-server?view=sql-server-2017</a></p>

<p><a href="https://www.mssqltips.com/sqlservertip/3076/how-to-read-the-sql-server-database-transaction-log/">https://www.mssqltips.com/sqlservertip/3076/how-to-read-the-sql-server-database-transaction-log/</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/sql/relational-databases/blob/filestream-sql-server?view=sql-server-2017">https://docs.microsoft.com/ru-ru/sql/relational-databases/blob/filestream-sql-server?view=sql-server-2017</a></p>
', 16, 28);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (71, N'Мониторинг ресурсов, EventLog уровень 1', N'Как посмотреть Perf counter, EventLog;

Зайти в монитор ресурсов, показать какой параметр за что отвечает', true, N'', 8, 29);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (72, N'Мониторинг ресурсов, EventLog уровень 2', N'Как писать Perf counter и в EventLog, когда это стоит делать',  true, N'', 10, 29);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (73, N'Профилирование запросов к БД', N'SQL Profiler',  true, N'', 20, 30);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (74, N'Профилирование кода', N'dotTrace, dotMemory dotPeek, ildasm',  true, N'', 20, 30);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (75, N'IDE уровень 1', N'ChormeDevTool - watch/callstack, Network (что отправил/получил), find element;

Visual Studio - пин табов, управление структурой проектов, дебаг - watch/callstack, поиски, билды, выбор конфигурации, startup project/

SQL Management studio - вызов операций,',  true, N'', 16, 31);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (76, N'IDE уровень 2', N'ChormeDevTool - Break on changes;

Visual Studio - locals, server explorer, configuring web project, file settings in csproj,

SQL Management studio - execution plan',  true, N'', 14, 31);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (77, N'Resharper и хоткеи уровень 1', N'Запуск тестов, управление тестами.;

Инструменты рефакторинга - какие есть.',  true, N'', 4, 32);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (78, N'Resharper и хоткеи уровень 2', N'Запуск профилирования через тест, дебага,;

Контракты - базовое понимание

Владение инструментами рефакторинга',  true, N'', 8, 32);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (79, N'Resharper и хоткеи уровень 3', N'работа со структурой проекта, code cleanup;

хоткеи на рефакторинги',  true, N'', 12, 32);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (80, N'Как работает (-)', N'',  true, N'', 10, 33);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (81, N'Умение писать LDAP query (-)', N'',  true, N'', 18, 33);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (82, N'Паттерны enterprise разработки уровень 1', N'Паттерны организации кода, базовые паттерны;

Decorator

Repository

Interceptor

Factory

Adapter

Observer', true, N'<h1 style="text-align:left">Теория</h1>

<ul>
	<li>Опишите своими словами паттерны и наиболее частые способы их применения:
	<ul>
		<li>Decorator</li>
		<li>Repository</li>
		<li>Interceptor</li>
		<li>Factory</li>
		<li>Adapter</li>
		<li>Observer</li>
	</ul>
	</li>
</ul>

<h2>Полезное чтиво</h2>

<p>Сергей Тепляков Паттерны проектирования на платформе .NET (2015) (можно найти на шаре \\srv-share\Public\Developers\Books)</p>;
', 9, 39);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (83, N'Паттерны enterprise разработки уровень 2', N'Паттерны многопоточности;

Specification

Fluent

Composite',  true, N'<h1 style="text-align:left">Теория</h1>

<ul>
	<li>Опишите своими словами паттерны и наиболее частые способы их применения:
	<ul>
		<li>
		<p>Specification</p>
		</li>
		<li>
		<p>Fluent</p>
		</li>
		<li>
		<p>Composite</p>
		</li>
	</ul>
	</li>
	<li>
	<p>Опишите своими словами ключевые паттерны работы с многопоточностью и асинхронностью в .NET&nbsp;</p>
	</li>
</ul>

<h1>Практика</h1>

<p>Найдите, покажите и объясните причины применения на практике (не обязательно Вами или в Ваших проектах) следующих паттернов:</p>;

<ul>
	<li>Decorator</li>
	<li>Repository</li>
	<li>Interceptor</li>
	<li>Factory</li>
	<li>Adapter</li>
	<li>Observer</li>
</ul>

<h2>Полезное чтиво</h2>

<p>Сергей Тепляков Паттерны проектирования на платформе .NET (2015) (можно найти на шаре \\srv-share\Public\Developers\Books)</p>;

<p><a href="https://prashantbrall.wordpress.com/2011/05/22/specification-pattern/">https://prashantbrall.wordpress.com/2011/05/22/specification-pattern/</a></p>

<p><a href="https://www.codeproject.com/Articles/640997/Fluent-interfaces-and-Method-Chaining-in-Csharp">https://www.codeproject.com/Articles/640997/Fluent-interfaces-and-Method-Chaining-in-Csharp</a></p>

<p><a href="https://intellitect.com/wp-content/uploads/2011/01/Ch19.pdf">https://intellitect.com/wp-content/uploads/2011/01/Ch19.pdf</a></p>

<p>&nbsp;</p>
', 20, 39);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (84, N'Паттерны enterprise разработки уровень 3', N'Паттерны реорганизации кода;
Паттерны безопасности

Builder

Interpretator',  true, N'<h1 style="text-align:left">Теория</h1>

<ul>
	<li>Опишите своими словами паттерны и наиболее частые способы их применения:
	<ul>
		<li>
		<p>Builder</p>
		</li>
		<li>
		<p>Interpretator</p>
		</li>
	</ul>
	</li>
	<li>
	<p>Расскажите основные о ключевых техниках реорганизации кода</p>
	</li>
	<li>
	<p>Расскажите своими словами об основных паттернах&nbsp;безопасности, применяемых&nbsp;для корпоративных систем</p>
	</li>
</ul>

<h1>Практика</h1>

<p>Найдите, покажите и объясните причины применения на практике (не обязательно Вами или в Ваших проектах) следующих паттернов:</p>;

<ul>
	<li>
	<p>Specification</p>
	</li>
	<li>
	<p>Fluent</p>
	</li>
	<li>
	<p>Composite</p>
	</li>
</ul>

<h2>Полезное чтиво</h2>

<p><a href="https://wso2.com/library/articles/2013/08/enterprise-security-patterns/">https://wso2.com/library/articles/2013/08/enterprise-security-patterns/</a></p>

<p>Refactoring to Patterns -&nbsp;Джошуа Керивски</p>
', 20, 39);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (85, N'ADO.NET уровень 2', N'TransactionScope',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>;

<ol>
	<li>Объясните своими словами, что представляет собой класс DbConnection?&nbsp; Какие механизмы взаимодействия с базой данных он нам открывает?</li>
	<li>Чем отличается работа с ADO.NET от работы с EF?&nbsp;</li>
	<li>Каким образом можно организовать работу с транзакциями используя DbConnection?</li>
	<li>В чем плюс использования TransactionScope над DbTransaction? Что такое &quot;Implicit Transaction&quot; в терминологии M$?</li>
</ol>

<p><!--EndFragment--></p>

<h3>Практика</h3>

<p>Создайте простейший менеджер транзакций (с методами &quot;GetFor(obj: object) : DbTransaction&quot;&nbsp;&quot;DisposeFor(obj: object)&quot; ).</p>;

<p>Бонус-задача: напишите код, транзакционно сохраняющий файл.</p>

<p><!--StartFragment--></p>

<p><span style="font-size:24px">Полезное чтиво</span></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/framework/data/transactions/implementing-an-implicit-transaction-using-transaction-scope">https://docs.microsoft.com/ru-ru/dotnet/framework/data/transactions/implementing-an-implicit-transaction-using-transaction-scope</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/api/system.transactions.transactionscope?view=netframework-4.8">https://docs.microsoft.com/ru-ru/dotnet/api/system.transactions.transactionscope?view=netframework-4.8</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/api/system.data.common.dbtransaction?view=netframework-4.8">https://docs.microsoft.com/ru-ru/dotnet/api/system.data.common.dbtransaction?view=netframework-4.8</a></p>

<p><a href="https://stackoverflow.com/questions/3267595/how-do-i-open-a-windows-7-transacted-file-in-c-sharp">https://stackoverflow.com/questions/3267595/how-do-i-open-a-windows-7-transacted-file-in-c-sharp</a></p>
', 14, 8);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (86, N'Стили-web уровень 1', N'Принципы работы css, понимание что такое компилируемые диалекты css и зачем они нужны.;

Основные стили Boostrap, идеология 12-колоночной разметки.',  true, N'<h3>Рекомендуемые вопросы</h3>

<ol>
	<li>Как можно описать стиль html-элемента?</li>
	<li>​Что такое css? В чем выражается &quot;каскадность&quot;?</li>
	<li>Опишите последовательсность приоритетов каждого из способов объявления применяемых стилей для элементов разметки.</li>
	<li>Что можно использовать в css-selector&#39;ах?</li>
	<li>Опишите базовые свойства стилей, помогающие в верстке страниц (position, margin, padding, border, top/bottom... , color, background, visibility, display, opacity)</li>;
	<li>Что такое 12-колончная разметка? Зачем она нужна?</li>
	<li>Что такое responsive-разметка? Как она реализуется (в самой банальной реализации)?</li>;
	<li>Откуда можно получить информацию о корпоративных стилях EY?</li>
</ol>

<h3>Полезное чтиво​</h3>
<!--EndFragment-->

<p><a href="https://ru.wikipedia.org/wiki/CSS" target="">https://ru.wikipedia.org/wiki/CSS</a></p>

<p><a href="https://habr.com/company/rambler-co/blog/261679/" target="">https://habr.com/company/rambler-co/blog/261679/</a>​</p>

<p><a href="https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B0%D0%BF%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9_%D0%B2%D0%B5%D0%B1-%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD" target="">https://ru.wikipedia.org/wiki/%D0%90%D0%B4%D0%B0%D0%BF%D1%82%D0%B8%D0%B2%D0%BD%D1%8B%D0%B9_%D0%B2%D0%B5%D0%B1-%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD</a>​</p>

<p><a href="https://caniuse.com/" target="">https://caniuse.com/</a>&nbsp;- сайт с описанием поддерживаемых функций css/html/js в тех или иных версиях браузеров.</p>

<p><a href="https://pltm-core.qa.eycistt.local/Home/UiKit" target="">https://pltm-core.qa.eycistt.local/Home/UiKit</a>&nbsp;- demo платформы со стилями​</p>
', 12, 51);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (87, N'Стили-web уровень 2', N'Продвинутое знание магии css, знание синтаксиса scss, HTML5 - базовое понимание новых элементов, ',  true, N'<h3>Рекомендуемые вопросы</h3>;

<p>Какие в связи с этим могут возникнуть проблемы при рендере?</p>

<ol>
	<li>Как работает display?</li>
	<li>Что такое media-query? что она позволяет сделать?</li>
	<li>Можо ли установить размеры элементов, базируясь на размерах экрана? А в процентном соотношении?</li>
	<li>(опционально) ngClass ngStyle - как работают? Что можно при помощи них сделать?</li>;
	<li>Как связан css и scss? Какие ключевые возможности ﻿дает scss по сравнению с plain-css?</li>
	<li>Как обрабатывается scss в наших приложениях?</li>
	<li>В чем различия между:
	<ol>
		<li>Подключением глобальных стилей</li>
		<li>Подключением стилей к компоненту angular?</li>
	</ol>
	</li>
</ol>

<h3>Практика</h3>

<p>Необходимо сверстать HTML-документ, отображающий элементы контента следующим образом</p>

<p>&nbsp;</p>

<p>​<a href="https://imgur.com/ut9uTGR" target="">https://imgur.com/ut9uTGR</a></p>

<p><a href="https://imgur.com/qeKz93W" target="">https://imgur.com/qeKz93W</a>​</p>

<p><a href="https://imgur.com/VDPvhUE" target="">https://imgur.com/VDPvhUE</a>​</p>

<h3>Полезное чтиво​</h3>

<p><a href="https://www.w3schools.com/cssref/css_units.asp" target="">https://www.w3schools.com/cssref/css_units.asp</a>​</p>

<p><a href="https://sass-scss.ru/guide/" target="">https://sass-scss.ru/guide/</a>​</p>

<p><a href="https://learn.javascript.ru/display" style="font-size: 14px;" target="">https://learn.javascript.ru/display</a><span style="font-size:14px">​</span><!--EndFragment--><br />
<a href="https://codecraft.tv/courses/angular/built-in-directives/ngstyle-and-ngclass/" target="">https://codecraft.tv/courses/angular/built-in-directives/ngstyle-and-ngclass/</a>​</p>
', 18, 51);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (88, N'DevExtreme уровень 1', N'Базовые навыки использования компонентов DevExtreme, базовое понимание структуры компонентов. DataSource и их типы, общие свойства (paging, edit), утилитарные методы EY.Platform для работы в Angular и TS.',  true, N'<h2>Рекомендуемые вопросы</h2>;

<ol>
	<li>Какие наиболее полезные компоненты DevExtreme можете вспомнить? В чем преимущество использования этих компонент по сравнению с jquery-плагинами или из библиотек angular?</li>
	<li>На примере любого компонента (dxList, dxSelectBox, dxDataGrid и т.п.) опишите его внутреннюю структуру, способ инициализации, способ заполнения и связки данными.</li>;
	<li>Как определяются вложенные свойства конфигурации компонентов DevExtreme в разметке angular? Приведите пример.</li>
</ol>

<h2>Практика</h2>

<p>Создайте angular-приложение, которое будет выполнять crud действия над справочником. Приложение должно отображать список через dxList. Список элементов должен получаться с сервера.</p>

<p>Выбранный элемент должен отображаться справа от списка в виде набора изменяемых полей данного элемента.&nbsp;</p>

<p>Должна быть предусмотрена возможность <span style="font-size:14px">отредактировать&nbsp;</span>элемент, добавить новый элемент, сохранить элемент. При переключении выбранного элемента внесенные изменения должны сбрасываться.</p>

<h2>Полезное чтиво​</h2>

<p><a href="https://js.devexpress.com/Documentation/16_2/Guide/Getting_Started/Widget_Basics_-_Angular/Create_and_Configure_a_Widget/" target="">https://js.devexpress.com/Documentation/16_2/Guide/Getting_Started/Widget_Basics_-_Angular/Create_and_Configure_a_Widget/</a></p>

<p>​<a href="https://js.devexpress.com/Documentation/16_2/Guide/Getting_Started/Widget_Basics_-_Angular/Call_Methods/" target="">https://js.devexpress.com/Documentation/16_2/Guide/Getting_Started/Widget_Basics_-_Angular/Call_Methods/</a></p>

<p><a href="https://js.devexpress.com/Documentation/16_2/Guide/Data_Layer/Data_Layer/" target="">https://js.devexpress.com/Documentation/16_2/Guide/Data_Layer/Data_Layer/</a>​</p>
', 12, 53);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (89, N'DevExtreme уровень 2', N'Шаблонизация компонентов DevExtreme в целом, dialog-окна, основные event''ы dxDataGrid, типы его редактирования, колонок.;
Работа и кастомизация DateBox, возможности Menu / ContextMenu, PivotGrid, Scheduler, treeview.
Механизм валидации и его конфигурация.',  true, N'<h3>Рекомендуемые вопросы</h3>

<ol>
	<li>Каким образом описываются шаблоны для DevExtreme-компонент?</li>
	<li>Опишите примеры требований, в рамках которых можно было бы использовать компоненты&nbsp;Menu / ContextMenu, PivotGrid, Scheduler, TreeView? Каким образом в этих ситуациях можно было бы воспользоваться дополнительными возможностями и настройками компонентов, чтобы улучшить User eXperience?</li>
	<li>Опишите несколько способов предоставить Пользователю возможность выбора года.</li>
	<li>Опишите ключевые event&#39;ы компонента&nbsp;dxDataGrid, которые могут понадобитсья при работе с ним.</li>
	<li>Какие типы колонок можно задать для&nbsp;dxDataGrid? Какие есть режимы редактирования&nbsp;dxDataGrid?</li>
	<li>Каким образом можно создать клиентскую валидацию у компонентов DevExtreme?</li>
	<li>Чем отличается Promise в Typescript от ожидаемого DevExtreme Promise?&nbsp;</li>
</ol>

<h3>Практика</h3>

<p>Создайте приложение с dxDataGrid, в котором используйте кастомные колонки (поля типа textarea, отображать данные в multiline). Используйте кастомный DataStore для общения с сервером. Включите возможность добавлять/изменять/удалять записи.</p>;

<h3>Полезное чтиво​</h3>

<p><a href="https://js.devexpress.com/Documentation/Guide/Widgets/Common/Templates/#Custom_Templates" target="">https://js.devexpress.com/Documentation/Guide/Widgets/Common/Templates/#Custom_Templates</a>​</p>

<p><a href="https://js.devexpress.com/Documentation/ApiReference/UI_Widgets/Markup_Components/dxTemplate/" target="">https://js.devexpress.com/Documentation/ApiReference/UI_Widgets/Markup_Components/dxTemplate/</a></p>

<p><a href="https://js.devexpress.com/Documentation/Guide/Widgets/DataGrid/Columns/Overview/" target="">https://js.devexpress.com/Documentation/Guide/Widgets/DataGrid/Columns/Overview/</a></p>

<p>​<a href="https://js.devexpress.com/Documentation/ApiReference/UI_Widgets/dxDataGrid/Row/#data" target="">https://js.devexpress.com/Documentation/ApiReference/UI_Widgets/dxDataGrid/Row/#data</a></p>

<p><a href="https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/CascadingLookups/jQuery/Light/" target="">https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/CascadingLookups/jQuery/Light/</a>​</p>

<p><a href="https://js.devexpress.com/Documentation/Guide/Widgets/" target="">https://js.devexpress.com/Documentation/Guide/Widgets/</a></p>
', 16, 53);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (90, N'Javascript уровень 1', N'Примитивы и объекты - типы в JS и их особенности. ;
setTimeout и setInterval',  true, N'<h3 style="font-size: 24px;">Рекомендуемые вопросы</h3><ol style="font-size: 14px;"><li>Что из себя представляет любой объект в JS? А что насчет функций?</li><li>Как ограничивается область видимости переменных и функций в JS?</li><li>Как вывести debug-данные в консоль разработчика для отладки JS?</li><li>Какая разница между null и undefined?</li><li>Можно ли пользуясь базовым функционалом создать в js объект, в котором ключами к индексатору будут объекты?</li><li>Можно ли реализовать ООП в JS?</li><li>Опишите методы setTimeout и setInterval - что позволяют сделать, в чем разница, как прервать исполнение.</li></ol><h3 style="font-size: 24px;">Полезное чтиво​<br/></h3><p><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction" target="">https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction</a>​</p><p></p><p><a href="https://learn.javascript.ru/object" target="" style="font-size: 14px;">https://learn.javascript.ru/object</a><span style="font-size: 14px;float: none;">​</span><!--EndFragment--><br/><a href="https://www.w3schools.com/js/js_scope.asp" target="">https://www.w3schools.com/js/js_scope.asp</a><br/></p><p><a href="https://frontender.info/exploring-the-abyss-of-null-and-undefined-in-javascript/" target="" style="font-size: 14px;">https://frontender.info/exploring-the-abyss-of-null-and-undefined-in-javascript/</a><span style="font-size: 14px;float: none;">​</span><br/></p><p></p><p><a href="https://learn.javascript.ru/settimeout-setinterval" target="" style="font-size: 14px;">https://learn.javascript.ru/settimeout-setinterval</a><span style="font-size: 14px;float: none;">​</span><br/></p><p></p><p></p>', 8, 52);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (91, N'Javascript уровень 2', N'Прототипы, стрелочные функции, let/const vs var, ES6 и модули.;
Closure, this, bind, apply',  true, N'<h3>Рекомендуемые вопросы</h3>

<ol>
	<li>Что такое ECMA Script?</li>
	<li>Что такое прототипно-ориентированное программирование? Что позволяет сделать прототипирование в JS?</li>
	<li>Что такое Closure? Что позволяет данный механизм? К каким негативным последствиям приводит его использование в JS?</li>
	<li>Что такое стрелочные функции? Чем они отличаются от анонимных функций? Как они соотносятся с Closure?</li>
	<li>Как можно задать для функции контекст исполнения (состояние, хранящееся в this)?</li>;
	<li>Что такое модули в JS? Как они работают?</li>
	<li>Какие полезные нововведения можете перечислить из ES6?</li>
</ol>

<h3>Полезное чтиво​</h3>

<p><a href="https://ru.wikipedia.org/wiki/ECMAScript" target="">https://ru.wikipedia.org/wiki/ECMAScript</a></p>

<p><a href="https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D1%82%D0%BE%D1%82%D0%B8%D0%BF%D0%BD%D0%BE%D0%B5_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5" target="">https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D1%82%D0%BE%D1%82%D0%B8%D0%BF%D0%BD%D0%BE%D0%B5_%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5</a></p>

<p><a href="https://developer.mozilla.org/ru/docs/Web/JavaScript/Closures" style="font-size: 14px;" target="">https://developer.mozilla.org/ru/docs/Web/JavaScript/Closures</a><br />
<a href="https://stackoverflow.com/questions/34361379/arrow-function-vs-function-declaration-expressions-are-they-equivalent-exch" target="">https://stackoverflow.com/questions/34361379/arrow-function-vs-function-declaration-expressions-are-they-equivalent-exch</a></p>

<p><a href="https://learn.javascript.ru/modules" style="font-size: 14px;" target="">https://learn.javascript.ru/modules</a></p>
', 12, 52);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (92, N'Typescript уровень 1', N'Основные отличия TS от JS. Наследование и интерфейсы, generic и constraint''ы.;
Конструктор. Базовое понимание source map. Строгая типизация и использование ''any'', приведение типов.
scope видимости методов и классов. ',  true, N'<h2>Рекомендуемые вопросы</h2>

<ol>
	<li>Что такое Typescript? Что позволяет исполнять его в браузере?</li>
	<li>Возможно ли проводить debug для Typescript-кода в браузере? Если да, то что позволяет это делать?</li>
	<li>Как работают интерфейсы в TS и при его компиляции?</li>
	<li>generic-ограничения какого вида позволяется наносить на классы, методы?</li>
	<li>Каков scope видимости методов и свойств класса? Переменных его методов?&nbsp;</li>
	<li>Каким образом можно &quot;отключить&quot; строгую типизацию в TS?</li>
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://stackoverflow.com/questions/12694530/what-is-typescript-and-why-would-i-use-it-in-place-of-javascript" style="font-size: 14px;" target="">https://stackoverflow.com/questions/12694530/what-is-typescript-and-why-would-i-use-it-in-place-of-javascript</a><span style="font-size:14px">​</span><!--EndFragment--><br />
<a href="https://www.typescriptlang.org/docs/handbook/interfaces.html" target="">https://www.typescriptlang.org/docs/handbook/interfaces.html</a>​</p>

<p><a href="https://www.typescriptlang.org/docs/handbook/generics.html" target="">https://www.typescriptlang.org/docs/handbook/generics.html</a>​</p>

<p><a href="https://www.typescriptlang.org/docs/handbook/basic-types.html" target="">https://www.typescriptlang.org/docs/handbook/basic-types.html</a>​</p>

<p><a href="https://www.typescriptlang.org/docs/handbook/advanced-types.html" target="">https://www.typescriptlang.org/docs/handbook/advanced-types.html</a>​</p>

<p>&nbsp;</p>
', 10, 52);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (93, N'Typescript уровень 2', N'Статические функции. Опциональные параметры и свойства. Расширение интерфейсов. перегрузки, property (getter/setter)',  true, N'<h2>Рекомендуемые вопросы</h2>;

<ol>
	<li>Как создать factory-метод для объекта, у которого много опциональных параметров?</li>
	<li>Как добавить функцию в глобальный синглтон &#39;window&#39;? (может быть полезно, если внешняя js библиотека пополняет window, однако этого не видит TS)</li>;
	<li>Возможно ли организовать перегрузку методов в TS? Какие у данного механизма есть ограничения?</li>
	<li>Что делают ключевые слова export и import?</li>
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://aliolicode.com/2016/05/07/typescript-static-members/" target="">https://aliolicode.com/2016/05/07/typescript-static-members/</a>​</p>

<p><a href="https://www.typescriptlang.org/docs/handbook/modules.html" style="font-size: 14px;" target="">https://www.typescriptlang.org/docs/handbook/modules.html</a><span style="font-size:14px">​</span></p>

<p>&nbsp;</p>

<p><a href="https://stackoverflow.com/questions/12688275/method-overloading/12689054#12689054" target="">https://stackoverflow.com/questions/12688275/method-overloading/12689054#12689054</a>​</p>

<p><a href="https://stackoverflow.com/questions/12827266/get-and-set-in-typescript" target="">https://stackoverflow.com/questions/12827266/get-and-set-in-typescript</a>​</p>

<p>&nbsp;</p>
', 16, 52);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (94, N'SystemJS уровень 1 (-)', N'Понимание принципа работы сборщиков пакетов. path vs map, packages.',  true, N'', 0, 57);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (95, N'Angular - ui уровень 1', N'Компоненты, их внутреннее взаимодействие, биндинги и их типы, синтаксис. Межкомпонентные вызовы. Наиболее часто используемые директивы.',  true, N'<h2>Рекомендуемые вопросы</h2>;

<ol>
	<li>Опишите роль, которую играют Компоненты в angular 4</li>
	<li>Опишите способы внутреннего&nbsp;взаимодействия между компонентами.</li>
	<li>Какие есть типы биндингов каков их&nbsp;синтаксис?</li>
	<li>Как можно производить межкомпонентные вызовы?</li>
	<li>Назовите и опишите синтаксис наиболее часто используемых&nbsp;директив.</li>
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://angular.io/api/core/Component#description">https://angular.io/api/core/Component#description</a></p>

<p><a href="https://angular.io/api/core/EventEmitter#usage-notes">https://angular.io/api/core/EventEmitter#usage-notes</a></p>

<p><a href="https://angular.io/api/core/ViewChild">https://angular.io/api/core/ViewChild</a></p>

<p><a href="https://angular.io/guide/component-interaction">https://angular.io/guide/component-interaction</a></p>

<p>&nbsp;</p>
', 14, 54);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (96, N'Angular - ui уровень 2', N'Парадигма MVVM в Angular. ;
Работа биндинга изнутри - политики обновления, отслеживания изменений. Создание собственных директив. Пайпы - синтаксис, популярные пайпы.',  true, N'<h2>Рекомендуемые вопросы</h2>

<ol>
	<li>Опишите стандартное распределение ответственностей между View,&nbsp;Component и Model в Angular. Возможно ли делегировать части ответственности модели? В&nbsp;каких случаях это дает выигрыш?</li>
	<li>Какие есть политики обнаржения изменений? Как они работают?</li>
	<li>Что необходимо, чтобы создать собственную директиву? В каких случаях стоит использовать собственные директивы?</li>
	<li>Опишите синтаксис использования pipe, назовите наиболее популярные пайпы.</li>
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://stackoverflow.com/questions/36950582/angular2-mvc-mvvm-or-mv">https://stackoverflow.com/questions/36950582/angular2-mvc-mvvm-or-mv</a></p>

<p><a href="https://habr.com/post/327004/">https://habr.com/post/327004/</a></p>

<p><a href="https://angular.io/guide/attribute-directives">https://angular.io/guide/attribute-directives</a></p>

<p><a href="https://angular.io/guide/pipes">https://angular.io/guide/pipes</a></p>
', 20, 54);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (97, N'Angular - modules, DI, packing уровень 1', N'Атрибуты @Component и @NgModule - способы конфигурации, влияние на поведение приложения.;
forRoot(), Сервисы vs компоненты;
дефолтный роутинг angular 4 - стандартные сценарии (дочерние компоненты, роут по умолчанию, редирект);
httpClient',  true, N'<h2>Рекомендуемые вопросы</h2>

<ol>
	<li>Каким образом запускается angular-приложение? Каким образом оно конфигурируется?</li>
	<li>Какие способы конфиграции angular-приложения существуют?</li>
	<li>Что делает метод Module.forRoot()?</li>;
	<li>Опишите, как работает встроенный роутинг angular 4 - стандартные сценарии (дочерние компоненты, роут по умолчанию, редирект)</li>;
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://blog.cloudboost.io/bootstrapping-angular-4-app-711722a4e816">https://blog.cloudboost.io/bootstrapping-angular-4-app-711722a4e816</a></p>

<p><a href="https://medium.com/@chrishouse/when-to-use-angulars-forroot-method-400094a0ebb7">https://medium.com/@chrishouse/when-to-use-angulars-forroot-method-400094a0ebb7</a></p>

<p><a href="https://angular.io/guide/ngmodules">https://angular.io/guide/ngmodules</a></p>

<p><a href="https://angular.io/guide/router">https://angular.io/guide/router</a></p>
', 10, 55);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (98, N'Angular - modules, DI, packing уровень 2', N'регистрация в DI по токенам, декораторы.;
продвинутые сценарии роутинга - подмена, последовательность сборки роутов из модулей. ленивая загрузка модулей.',  true, N'<h2>Рекомендуемые вопросы</h2>

<ol>
	<li>Как работает регистрация в DI angular?</li>
	<li>Как работает регистрация по токенам? Как можно создать декоратор для сервиса?</li>
	<li>Как можно подменить роутинг поверх уже реализованного? Каким образом?</li>
	<li>Что такое ленивая загрузка модулей? Как можно ее реализовать?</li>
	<li>Как можно получить параметры из роута в angular? Почему для этого нужен subscribe?</li>
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://angular.io/guide/dependency-injection">https://angular.io/guide/dependency-injection</a></p>

<p><a href="https://angular.io/guide/dependency-injection-pattern">https://angular.io/guide/dependency-injection-pattern</a></p>

<p><a href="https://angular.io/guide/hierarchical-dependency-injection">https://angular.io/guide/hierarchical-dependency-injection</a></p>

<p><a href="https://codecraft.tv/courses/angular/dependency-injection-and-providers/tokens/">https://codecraft.tv/courses/angular/dependency-injection-and-providers/tokens/</a></p>

<p><a href="https://habr.com/post/351036/">https://habr.com/post/351036/</a></p>

<p><a href="https://angular-2-training-book.rangle.io/handout/routing/routeparams.html">https://angular-2-training-book.rangle.io/handout/routing/routeparams.html</a></p>

<p><a href="https://angular.io/guide/lazy-loading-ngmodules">https://angular.io/guide/lazy-loading-ngmodules</a></p>
', 16, 55);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (99, N'rxjs уровень 1', N'отличие реактивного стиля от функционального (ооп);
Observable - зачем нужен и как полчать из него события (subscribe) (subscribe + map);
простые способы создания Observable: empty, create, from, fromEvent, fromPromise, interval, timer, of, throw
Отчистка/освобождение подписок',  true, N'<h2>Рекомендуемые вопросы</h2>

<ol>
	<li>Назовите отличия реактивного стиля от функционального (ооп).</li>;
	<li>Каким целям служит класс Observable? Каким образом можно подписываться на них?</li>
	<li>Каким образом можно получить объект Observable?</li>
	<li>Каким образом можно отписаться от подписки? по какой причине может возникнуть потребность в этом?</li>
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://gist.github.com/staltz/868e7e9bc2a7b8c1f754" target="_blank">https://gist.github.com/staltz/868e7e9bc2a7b8c1f754</a></p>

<p><a href="http://reactivex.io/documentation/observable.html">http://reactivex.io/documentation/observable.html</a></p>

<p><a href="https://www.learnrxjs.io/operators/creation/">https://www.learnrxjs.io/operators/creation/</a></p>

<p><a href="https://blog.codecentric.de/en/2018/01/different-ways-unsubscribing-rxjs-observables-angular/">https://blog.codecentric.de/en/2018/01/different-ways-unsubscribing-rxjs-observables-angular/</a></p>
', 14, 52);

INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (100, N'rxjs уровень 2', N'Источник сообщений для Observable - Subject и принципы его работы;
Готовые источники сообщений: BehaviourSubject, ReplaySubject
Построение последовательных вызовов rxjs (pipe только в 6й версии);
Расширенные способы обработки observable',  true, N'<h2>Рекомендуемые вопросы</h2>

<ol>
	<li>Что такое Subject в рамках rxjs? Какую роль он выполняет?</li>
	<li>Какие вы знаете готовые поставщики rx-сообщений? Как они работают?</li>
	<li>Как можно построить цепочку из обрабатываемых сообщений на rx?</li>
	<li>Опишите механизмы работы расширенных способов обработки Observable (do, filter, zip/formJoin, retry, share, shareReplay, take/skip, buffer, pluck).</li>;
</ol>

<h2>Полезное чтиво​</h2>

<p><a href="https://github.com/Reactive-Extensions/RxJS/blob/master/doc/gettingstarted/subjects.md">https://github.com/Reactive-Extensions/RxJS/blob/master/doc/gettingstarted/subjects.md</a></p>

<p><a href="http://xgrommx.github.io/rx-book/content/subjects/index.html">http://xgrommx.github.io/rx-book/content/subjects/index.html</a></p>

<p><a href="https://stackoverflow.com/questions/37748241/how-to-do-the-chain-sequence-in-rxjs/37748799#37748799">https://stackoverflow.com/questions/37748241/how-to-do-the-chain-sequence-in-rxjs/37748799#37748799</a></p>

<p>&nbsp;</p>
', 18, 52);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (101, N'wiki - confluence уровень 1', N'Владение инструментарием поиска, понимание механизмов работы и способов размещения информации',  true, N'', 4, 34);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (102, N'wiki - confluence уровень 2', N'Шэринг знаний, работа с макросами и разметкой.;

Оформлено 1 или более статей по обучению, наличие проектных статей - приветствуется.',  true, N'', 12, 34);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (103, N'tfs уровень 1', N'доска, query, карточка задачи, работа по задачам, ',  true, N'', 6, 35);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (104, N'tfs уровень 2', N'CI конвейер, релизы, билд-агенты',  true, N'', 14, 35);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (105, N'git уровень 1', N'концепция git;
clone/pull/push/fetch/merge
что такое stash и branch',  true, N'', 7, 36);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (106, N'git уровень 2', N'revert, reset, patching/cherry-pick',  true, N'', 12, 36);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (107, N'таймшиты и gtag', N'умение пользоваться, знание процедур',  true, N'', 4, 37);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (108, N'Степень самостоятельности уровень 1', N'Отсутствует необходимость в принятии самостоятельных решений, следует определенным инструкциям, полномочия ограничены, имеется постоянный контроль',  true, N'', 0, 40);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (109, N'Степень самостоятельности уровень 2', N'Принимаются стандартные решения под контролем руководителя, нестандартные ситуации решаются начальником	',  true, N'', 0, 40);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (110, N'Степень самостоятельности уровень 3', N'Цели определены линейным / проектным руководителем. Планирование конкретных задач и организация работы проводится самостоятельно',  true, N'', 0, 40);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (111, N'Степень самостоятельности уровень 4', N'Формулируются только общие цели, работником проводится самостоятельная разработка методов и средств достижения целей (исходя из политики организации)',  true, N'', 0, 40);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (112, N'Зона ответственности в рамках проекта уровень 1', N'Классы, связанные с создаваемым функционалом.;

Участие в оценке по задачам.

Тесты, связанные с создаваемым функционалом.

Дополнительные материалы, связанные с технической стороной проекта (вспомогательная документация).;

',  true, N'', 0, 41);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (113, N'Зона ответственности в рамках проекта уровень 2', N'Блоки функционала системы / подсистемы.;

Оценка блоков функционала.

Содержимое технической документации по проекту, связанное с вопросами практической реализации функционала.

',  true, N'', 0, 41);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (114, N'Зона ответственности в рамках проекта уровень 3', N'Функционал разрабатываемой со стороны компании системы / подсистемы в целом.;

Оценка разрабатываемой системы / подсистемы в целом.

Общение с техническими специалистами Заказчика по необходимости',  true, N'', 0, 41);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (115, N'Руководство группой разработки уровень 1', N'1-2 человека в команде',  true, N'', 0, 43);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (116, N'Руководство группой разработки уровень 2', N'3-4 человека в команде',  true, N'', 0, 43);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (117, N'Оценка со стороны Project Manager''а - требуется', N'',  true, N'', 0, 44);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (118, N'Соблюдение стандартов разработки - требуется', N'',  true, N'', 0, 45);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (119, N'Знание процесс разработки уровень 1', N'Требуется знание своих процессов',  true, N'', 8, 46);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (120, N'Знание процесс разработки уровень 2', N'Требуется понимание процессов разработки в целом (разработка + ведение проекта по итерациям)',  true, N'', 12, 46);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (121, N'Знание процесс разработки уровень 3', N'Требуется понимание процессов группы в целом',  true, N'', 10, 46);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (122, N'Опыт работы (лет) 1 год', N'',  true, N'', 0, 47);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (123, N'Опыт работы (лет) 2 года', N'',  true, N'', 0, 47);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (124, N'Опыт работы (лет) 6 лет', N'',  true, N'', 0, 47);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (125, N'Количество необязательных компетенций - 2', N'',  true, N'', 0, 49);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (126, N'Количество необязательных компетенций - 7', N'',  true, N'', 0, 49);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (127, N'Количество необязательных компетенций - 10', N'',  true, N'', 0, 49);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (128, N'Выступления с докладом - 2', N'',  true, N'', 0, 50);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (129, N'Выступления с докладом - 4', N'',  true, N'', 0, 50);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (130, N'System.Collections/LINQ уровень 4', N'Знание технолгий и механизмов, стоящих за IQueriable, возможность их имплементировать',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>;

<ol>
	<li>Для каких задач можно использовать IQueriable?</li>
	<li>Каким образом работают IQueriable? Расскажите подробнее о каждом элементе инфраструктуры (на примере реализации).</li>;
</ol>

<h3>Практика:</h3>

<p>Создайте QueryProvider, который записывает в лог-файл любые полученные запросы.&nbsp;</p>

<h3>Полезное чтиво</h3>

<p><a href="https://habr.com/ru/post/256821/">https://habr.com/ru/post/256821/</a></p>
', 6, 4);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (131, N'AppDomain, Assembly и их сборка (уровень 1)', N'AppDomain, Assembly и их сборка',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>;

<ol>
	<li>Создание AppDomain, работа нескольких приложений на .NET в одном процессе - как работает?</li>
	<li>Возможно ли выгружать сборки из .NET приложения? Каким образом?</li>
	<li>GAC - что это? Где физически хранятся файлы GAC? Как добавить в него библиотеку, и в чем могут возникнуть проблемы при использовании GAC? Какие плюсы от его использования получают приложения .NET?</li>
</ol>

<p><!--EndFragment--></p>

<h3>Практика</h3>

<p>Создайте приложение, которое создает два дочерних AppDomain с разграничением прав - одно может только открывать и читать файл, второе - создавать и писать.Приложение должно получать имя файла, дергать одни домен для чтения файла и заставлять второй домен писать данные в файл по тому же пути, но имеющее &quot;1&quot; на конце имени.</p>

<p>Для простоты примера предлагается использовать AppDomain.SetData для передачи информации и DoCallback для комманд</p>

<p><!--StartFragment--></p>

<p><span style="font-size:24px">Полезное чтиво</span></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/api/system.appdomain?view=netframework-4.8">https://docs.microsoft.com/ru-ru/dotnet/api/system.appdomain?view=netframework-4.8</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/framework/app-domains/how-to-create-an-application-domain">https://docs.microsoft.com/ru-ru/dotnet/framework/app-domains/how-to-create-an-application-domain</a></p>

<p><a href="https://stackoverflow.com/questions/314268/how-best-to-communicate-between-appdomains">https://stackoverflow.com/questions/314268/how-best-to-communicate-between-appdomains</a></p>
', 8, 9);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (132, N'AppDomain, Assembly и их сборка (уровень 2)', N'Понимание AssemblyBinding, Marchaling, как происходит сборка dll, Strong name	',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>;

<ol>
	<li>Как механизм AssemblyBinding помогает в сборке приложения?</li>
	<li>Опишите механизм сборки Assembly, последовательность действий</li>
	<li>Какие аспекты влияют на очередность сборки проектов?</li>
	<li>По какой логике определяется, должна ли копироваться assembly в папку со сборкой (релизом)?</li>;
	<li>Каким образом могут попадать файлы проекта в сборку? По каким правилам и используя какие механизмы? Что такое Target/Task в терминологии csproj</li>
</ol>

<p><!--EndFragment--></p>

<p><!--StartFragment--></p>

<p><span style="font-size:24px">Полезное чтиво</span></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/framework/configure-apps/redirect-assembly-versions">https://docs.microsoft.com/ru-ru/dotnet/framework/configure-apps/redirect-assembly-versions</a></p>

<p><a href="https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-build-process">https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-build-process</a></p>

<p><a href="https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-project-file">https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-project-file</a></p>

<p><a href="https://stackoverflow.com/questions/15816769/dependent-dll-is-not-getting-copied-to-the-build-output-folder-in-visual-studio">https://stackoverflow.com/questions/15816769/dependent-dll-is-not-getting-copied-to-the-build-output-folder-in-visual-studio</a></p>

<p>&nbsp;</p>
', 20, 9);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (133, N'Веб-сервисы в .NET', N'WCF, HttpListener, WebApi, Mvc - какие механизмы стоит использовать в каких случаях, почему',  true, N'<p><span style="color:inherit; font-size:24px">Рекомендуемые вопросы:</span></p>;

<ul>
	<li>WCF, HttpListener, WebApi, Mvc - какие механизмы стоит использовать в каких случаях?</li>
	<li>Каким образом можно внедрить DI в WCF-сервисы?</li>
	<li>Каковы основные методы изменения конфигурации WCF-сервиса?</li>
	<li>Какими не-управляемыми ресурсами&nbsp;пользуется HttpListener?</li>
	<li>Какие есть способы конфигурирования WebApi? Какие типы данных поддерживает по-умолчанию взаимодействие через WebApi?</li>
	<li>В чем разница между конвейером обработки запросов WebApi и MVC?</li>
</ul>

<h2>Практика</h2>

<p>Выберите любой сайт и сделайте с ним интеграцию по WCF.</p>

<p><!--EndFragment--></p>

<p><!--StartFragment--></p>

<p><span style="font-size:24px">Полезное чтиво</span></p>

<p><a href="https://stackoverflow.com/questions/40893529/how-to-implement-soap-service-on-webapi">https://stackoverflow.com/questions/40893529/how-to-implement-soap-service-on-webapi</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/aspnet/web-api/overview/advanced/configuring-aspnet-web-api">https://docs.microsoft.com/ru-ru/aspnet/web-api/overview/advanced/configuring-aspnet-web-api</a></p>

<p><a href="https://stackoverflow.com/questions/11662028/webapi-to-return-xml">https://stackoverflow.com/questions/11662028/webapi-to-return-xml</a></p>

<p><a href="https://docs.microsoft.com/ru-ru/dotnet/api/system.net.httplistener?view=netframework-4.8">https://docs.microsoft.com/ru-ru/dotnet/api/system.net.httplistener?view=netframework-4.8</a></p>
', 28, 10);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (134, N'Стили-web уровень 3', N'Работа с scss',  true, N'<h3>Рекомендуемые вопросы</h3>;

<ol>
	<li>Опишите основные конструкты scss</li>
	<li>Каким образом возможно обеспечить переиспользование блоков стилей между проектами без их прямого использования?</li>
</ol>

<h3>Полезное чтиво​</h3>

<p><!--EndFragment--></p>

<p><a href="https://sass-scss.ru/documentation/">https://sass-scss.ru/documentation/</a></p>
', 6, 51);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (135, N'SOA', N'Service oriented architecture и все прелести работы с ней',  true, N'<h2>Теория</h2><p><br></p><ul><li>Перечислите основные принципы построения сервисно ориентированной архитектуры</li><li>В чем отличия подходов SOA от микросервисной архитектуры</li><li>За счет каких основных инструментов выстраивается SOA архитектура?</li><li>Какие проблемы призван решить SOA подход? Как эти проблемы обрабатывает микросервисный подход и монолитные приложения?</li><li>Какие ключевые проблемы SOA не способна решить достаточно качественно?</li></ul><p><br></p><h2>Полезное чтиво</h2><p><a href="https://en.wikipedia.org/wiki/Service-oriented_architecture">https://en.wikipedia.org/wiki/Service-oriented_architecture</a></p><p><a href="https://web.archive.org/web/20160206132542/https://msdn.microsoft.com/en-us/library/bb833022.aspx">https://web.archive.org/web/20160206132542/https://msdn.microsoft.com/en-us/library/bb833022.aspx</a></p><p>\\srv-share\Public\Developers\Books\[SOA Patterns 1st Edition by Arnon Rotem-Gal-Oz - 2012].pdf - глава 1 - Solving SOA pains with patterns</p><p><br></p>', 30, 58);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (136, N'Типовые паттерны проектирования систем', N'Message-oriented architecture, Onion / hexagonal',  true, N'<h2>Теория</h2><p><br></p><ul><li>Опишите основные элементы MOA - архитектуры.</li><li>Какие проблемы решает MOA?</li><li>Опишите ключевые принципы луковой архитектуры? </li><li>В чем различие между гексагональной и луковой архитектурой?</li><li>Какую проблематику решает луковая архитектура и родственные ей? В каких условиях она слабо применима?</li></ul><p><br></p><h2>Полезное чтиво</h2><p><a href="https://en.wikipedia.org/wiki/Message-oriented_middleware">https://en.wikipedia.org/wiki/Message-oriented_middleware</a></p><p><a href="https://en.wikipedia.org/wiki/Message_queue">https://en.wikipedia.org/wiki/Message_queue</a></p><p><a href="https://stackoverflow.com/questions/52321971/ddd-ports-and-adapters-with-onion-architecture-what-goes-where">https://stackoverflow.com/questions/52321971/ddd-ports-and-adapters-with-onion-architecture-what-goes-where</a></p><p><a href="https://stackoverflow.com/questions/50039019/onion-architecture-compared-to-hexagonal">https://stackoverflow.com/questions/50039019/onion-architecture-compared-to-hexagonal</a><span class="ql-cursor">﻿</span></p>', 16, 58);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (137, N'Microservice (-)', NULL,  true, NULL, 0, 58);
INSERT INTO kaizen.skill.skill_levels (id, name, short_description, is_active, description, weight, skill_id) VALUES (138, N'MQ уровень 1 (-)', N'Понимание базовых концепций MQ, практика использования MQ в упрощенных условиях',  true, NULL, 0, 59);

INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (4, 1, 1, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (5, 1, 15, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (6, 1, 4, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (7, 3, 8, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (8, 3, 10, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (9, 1, 11, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (11, 1, 24, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (12, 3, 27, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (13, 3, 28, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (14, 1, 34, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (17, 1, 90, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (18, 3, 43, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (22, 3, 50, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (24, 1, 52, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (25, 3, 64, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (26, 1, 64, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (27, 1, 65, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (28, 1, 68, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (30, 1, 101, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (31, 1, 103, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (32, 1, 105, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (33, 1, 107, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (34, 1, 82, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (35, 1, 109, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (36, 1, 112, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (37, 1, 117, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (38, 1, 119, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (39, 1, 122, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (40, 2, 16, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (41, 2, 2, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (42, 2, 5, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (43, 2, 9, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (45, 2, 14, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (53, 1, 21, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (54, 2, 22, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (55, 2, 23, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (56, 2, 25, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (57, 2, 29, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (58, 2, 35, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (59, 2, 87, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (60, 2, 92, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (61, 2, 91, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (62, 2, 93, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (63, 2, 44, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (65, 1, 27, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (66, 1, 28, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (67, 1, 29, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (68, 1, 31, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (69, 1, 37, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (70, 1, 86, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (71, 1, 43, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (72, 1, 88, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (73, 1, 46, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (74, 1, 77, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (75, 2, 21, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (76, 2, 30, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (77, 2, 32, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (79, 2, 38, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (80, 2, 86, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (81, 2, 88, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (82, 2, 89, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (83, 2, 47, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (84, 2, 53, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (85, 2, 55, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (86, 2, 56, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (87, 2, 57, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (88, 2, 62, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (89, 2, 66, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (90, 2, 69, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (91, 2, 71, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (92, 2, 73, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (93, 2, 75, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (94, 2, 78, 1);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (95, 2, 81, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (96, 2, 102, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (97, 2, 106, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (98, 2, 83, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (99, 2, 110, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (100, 2, 113, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (101, 2, 115, 2);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (102, 2, 120, 0);
INSERT INTO kaizen.skill.requirements (id, grade_id, skill_level_id, type) VALUES (103, 2, 123, 0);